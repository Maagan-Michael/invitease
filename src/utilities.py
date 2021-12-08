from starlette.middleware.base import BaseHTTPMiddleware
from database import UsersRepository, InvitationRepository, create_connection
from fastapi import Request, Response
import requests

allowed_paths = ('/docs', '/openapi.json')


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)
