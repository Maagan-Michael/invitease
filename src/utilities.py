from starlette.middleware.base import BaseHTTPMiddleware
from database import UsersRepository, create_connection
from fastapi import Request, Response
import requests

allowed_paths = ('/docs', '/openapi.json')


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
            "openIdConnectUrl": "http://localhost:8081/auth/realms/master/.well-known/openid-configuration"
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
    if request.url.path.startswith(allowed_paths):
        return await call_next(request)
    if request.state.token is not None:
        user_response = requests.request(method='GET', url="http://localhost:8081/auth/realms/master/protocol/openid-connect/userinfo",
                                         headers={"Authorization": f"Bearer {request.state.token}"})
        if user_response.status_code == 200:
            request.state.user = user_response.json()
            response = await call_next(request)

    if response is None:
        response = Response(status_code=401)
    return response


async def extract_token(request: Request, call_next):
    if request.url.path.startswith(allowed_paths):
        return await call_next(request)
    authotization_header = request.headers.get('Authorization')
    if authotization_header is not None and authotization_header.startswith("Bearer"):
        request.state.token = authotization_header[len("Bearer "):]
    else:
        request.state.token = None
    response = await call_next(request)
    return response
