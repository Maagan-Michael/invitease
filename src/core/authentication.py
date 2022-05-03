from fastapi import Request, Response
import requests
import os
from starlette.middleware.base import BaseHTTPMiddleware
import inspect
import collections


class AuthenticationConfiguration:
    def __init__(self) -> None:
        self.openid_url = os.environ.get(
            'IVT_OPENID_DISCOVERY_URL',
            'http://localhost:8081/auth/realms/master/.well-known/openid-configuration')

        self._get_user_info_endpoint()
        self.allowed_paths = ('/docs', '/openapi.json')

    def _get_user_info_endpoint(self):
        response = requests.request(method='GET', url=self.openid_url)
        if(response.status_code == 200):
            global userinfo_endpoint
            self.userinfo_endpoint = response.json()['userinfo_endpoint']
        else:
            raise ValueError("Failed to get user info endpoint.")

    @property
    def openid_external_url(self):
        return os.environ.get(
            'IVT_OPENID_DISCOVERY_EXTERNAL_URL',
            self.openid_url)


configuration = None


def init_authentication(app):
    global configuration
    configuration = AuthenticationConfiguration()

    def init_openapi():
        return openapi_override(app)
    app.openapi = init_openapi

    app.add_middleware(BaseHTTPMiddleware, dispatch=decode_token)
    app.add_middleware(BaseHTTPMiddleware, dispatch=extract_token)


def openapi_override(app):
    from fastapi.openapi.utils import get_openapi
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title="Invitease",
        version="1.0.0",
        description="Invitease documentation",
        routes=app.routes,
    )
    openapi_schema['components']['securitySchemes'] = {
        "openId": {
            "type": "openIdConnect",
            "openIdConnectUrl": configuration.openid_external_url
        }
    }
    openapi_schema['security'] = [{
        'openId': [
            'profile',
            'email',
            'roles'
        ]
    }]

    app.openapi_schema = openapi_schema
    return app.openapi_schema


async def decode_token(request: Request, call_next):
    if request.url.path.startswith(configuration.allowed_paths):
        return await call_next(request)
    response = None
    if request.state.token is not None:
        user_response = requests.request(
            method='GET', url=configuration.userinfo_endpoint, headers={
                "Authorization": f"Bearer {request.state.token}"})
        if user_response.status_code == 200:
            request.state.user = user_response.json()
            response = await call_next(request)

    if response is None:
        response = Response(status_code=401)
    return response


async def extract_token(request: Request, call_next):
    if request.url.path.startswith(configuration.allowed_paths):
        return await call_next(request)
    response = None
    authorization_header = request.headers.get('Authorization')
    if authorization_header is not None and authorization_header.startswith(
            "Bearer"):
        request.state.token = authorization_header[len("Bearer "):]
    else:
        request.state.token = None
    response = await call_next(request)
    return response


class SignatureFixer():
    def _get_unique_arguments(self, arguments: list):
        unique_arguments = collections.OrderedDict()

        for argument in arguments:
            # eliminate this check if you want the last item
            if argument.name not in unique_arguments:
                unique_arguments[argument.name] = argument

        return list(unique_arguments.values())

    def _get_arguments(self, wrapper, handler):
        original_arguments = inspect.signature(handler).parameters.values()
        wrapper_arguments = filter(
            lambda p: p.kind not in (
                inspect.Parameter.VAR_POSITIONAL,
                inspect.Parameter.VAR_KEYWORD),
            inspect.signature(wrapper).parameters.values())
        without_default_values = filter(
            lambda x: x.default == inspect._empty, original_arguments)
        withdefault_values = filter(
            lambda x: x.default != inspect._empty, original_arguments)
        return [
            *without_default_values,
            *wrapper_arguments,
            *withdefault_values]

    def fix_signature(self, wrapper, handler):
        arguments = self._get_arguments(wrapper, handler)
        arguments = self._get_unique_arguments(arguments)
        wrapper.__signature__ = inspect.Signature(
            parameters=arguments,
            return_annotation=inspect.signature(handler).return_annotation,
        )


def require_roles(roles: list):

    def require_roles_decorator(handler):
        from functools import wraps

        async def wrapper(request: Request, *args, **kwargs):
            if any(x in roles for x in request.state.user['roles']):
                if inspect.iscoroutinefunction(handler):
                    result = await handler(*args, **kwargs)
                else:
                    result = handler(*args, **kwargs)
                return result
            return Response(status_code=401)
        SignatureFixer().fix_signature(wrapper, handler)
        return wrapper
    return require_roles_decorator
