from fastapi import Request
from database import EventLogRepository, create_connection, InvitationRepository
from keycloak import KeycloakUserRepository

allowed_paths = ('/docs', '/openapi.json')


def create_users_repository(request: Request) -> KeycloakUserRepository:
    return KeycloakUserRepository(request.state.token, "http://keycloak:8080/auth")


def create_eventlog_repository() -> EventLogRepository:
    connection = create_connection()
    return EventLogRepository(connection)


def create_invitation_repository() -> InvitationRepository:
    connection = create_connection()
    return InvitationRepository(connection)


def translate_export_headers(headers: list, model) -> dict:
    result = [(x, y) for x, y in model.__dict__.items() if x in headers]
    result = {x: y.info.get('export_title', x) for x, y in result}
    return result
