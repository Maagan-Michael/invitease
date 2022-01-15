from database import UsersRepository, EventLogRepository, create_connection, InvitationRepository

allowed_paths = ('/docs', '/openapi.json')


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)


def create_eventlog_repository():
    connection = create_connection()
    return EventLogRepository(connection)


def create_invitations_list():
    connection = create_connection()
    return InvitationRepository(connection)


def translate_export_headers(headers: list, model) -> dict:
    result = [(x, y) for x, y in model.__dict__.items() if x in headers]
    result = {x: y.info.get('export_title', x) for x, y in result}
    return result
