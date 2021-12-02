from repository_base import RepositoryBase

class UsersRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, "users")