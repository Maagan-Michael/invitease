from starlette.middleware.base import BaseHTTPMiddleware
from database import UsersRepository, create_connection
from fastapi import Request, Response
import requests
import os


class AuthenticationConfiguration:
    def __init__(self) -> None:
        self.openid_url = os.environ.get(
            'OPENID_DISCOVERY_URL', 'http://localhost:8081/auth/realms/master/.well-known/openid-configuration')
        self._get_user_info_endpoint()
        self.allowed_paths = ('/docs', '/openapi.json')

    def _get_user_info_endpoint(self):
        response = requests.request(method='GET', url=self.openid_url)
        if(response.status_code == 200):
            global userinfo_endpoint
            self.userinfo_endpoint = response.json()['userinfo_endpoint']
        else:
            raise ValueError("Failed to get user info endpoint.")

configuration = AuthenticationConfiguration()

def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)


def init_authentication(app):
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
            "openIdConnectUrl": configuration.openid_url
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
    if request.state.token is not None:
        user_response = requests.request(method='GET', url=configuration.userinfo_endpoint,
                                         headers={"Authorization": f"Bearer {request.state.token}"})
        if user_response.status_code == 200:
            request.state.user = user_response.json()
            response = await call_next(request)

    if response is None:
        response = Response(status_code=401)
    return response


async def extract_token(request: Request, call_next):
    if request.url.path.startswith(configuration.allowed_paths):
        return await call_next(request)
    authorization_header = request.headers.get('Authorization')
    if authorization_header is not None and authorization_header.startswith("Bearer"):
        request.state.token = authorization_header[len("Bearer "):]
    else:
        request.state.token = None
    response = await call_next(request)
    return response
