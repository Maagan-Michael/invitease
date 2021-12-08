from database import UsersRepository, create_connection


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)
