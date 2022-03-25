from typing import List

from database.models import User
from database.repository_base import RepositoryBase


class UsersRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, User, User.user_id)

    def get_user_by_id(self, user_ids: List[str] = []) -> list(User):
        if len(user_ids) > 0:
            def filter(x):
                return x.filter(User.user_id.in_(user_ids))
        else:
            def filter(x):
                return x
        return self.query(filter)
