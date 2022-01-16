from typing import List

from database.models import User
from database.repository_base import RepositoryBase


class UsersRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, User, User.user_id)

    def get_users_from_id_list(self, user_id_list: List[str] = []):
        return self.query(lambda x: (x.filter(User.user_id.in_(user_id_list))))
