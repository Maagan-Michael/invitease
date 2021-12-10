from database.events_repository import EventsLogRepository
from starlette.middleware.base import BaseHTTPMiddleware
from database import UsersRepository, EventLogRepository, create_connection
from fastapi import Request, Response
import requests

allowed_paths = ('/docs', '/openapi.json')


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)

def create_eventlog_repository():
    connection = create_connection()
    return EventLogRepository(connection)

