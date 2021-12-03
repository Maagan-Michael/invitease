from database.repository_base import RepositoryBase
from database.models import User

class UsersRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, User, User.user_id)