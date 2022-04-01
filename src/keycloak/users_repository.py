from requests import request
from keycloak.convertions import json_to_user
from database.models import User


class KeycloakClientBase:
    def __init__(self, access_token: str, base_url: str) -> None:
        self.base_url = base_url.strip('/') + '/admin/realms/master'
        self.access_token = access_token

    def build_url(self, *args) -> str:
        return '/'.join(s.strip('/') for s in [self.base_url, *args])


class KeycloakUserRepository(KeycloakClientBase):
    def __init__(self, access_token: str, base_url: str) -> None:
        super().__init__(access_token=access_token, base_url=base_url)

    def get_all(self) -> list[User]:
        return [json_to_user(x) for x in self._get_all_users()]

    def get_user_by_id(self, user_ids: list[str] = []) -> list[User]:
        if len(user_ids) > 0:
            users = self._get_users_by_id(user_ids)
        else:
            users = self._get_all_users()
        return [json_to_user(x) for x in users]

    def _get_users_by_id(self, user_ids: list[str] = []) -> list[dict]:
        def get_user(id):
            url = self.build_url("users", id)
            headers = {"Authorization": f'Bearer {self.access_token}'}
            response = request('GET', url, headers=headers)
            response.raise_for_status()
            return response.json()

        return [get_user(x) for x in user_ids]

    def _get_all_users(self) -> list[dict]:
        url = self.build_url("users")
        headers = {"Authorization": f'Bearer {self.access_token}'}
        response = request('GET', url, headers=headers)
        response.raise_for_status()
        return response.json()
