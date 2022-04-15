from cgi import print_form
from requests import request, Response
from keycloak.convertions import json_to_user
from database.models import User
import json

class KeycloakClientBase:
    def __init__(self, access_token: str, base_url: str) -> None:
        self.base_url = base_url.strip('/') + '/admin/realms/master'
        self.access_token = access_token

    def build_url(self, *args) -> str:
        return '/'.join(s.strip('/') for s in [self.base_url, *args])

    def _post(self, url: str,  body: any = None) -> Response:
        return self._send(method='POST', url=url, body=body, headers={"Content-Type": "application/json"})

    def _put(self, url: str,  body: any = None) -> Response:
        return self._send(method='PUT', url=url, body=body, headers={"Content-Type": "application/json"})

    def _get(self, url: str) -> Response:
        return self._send(method='GET', url=url)

    def _send(self, url: str, method: str, body: any = None, headers: dict = {}) -> Response:
        headers = headers.copy()
        headers["Authorization"] = f'Bearer {self.access_token}'
        response = request(method, url, headers=headers, json=body)
        response.raise_for_status()
        return response


class KeycloakUserRepository(KeycloakClientBase):
    def __init__(self, access_token: str, base_url: str) -> None:
        super().__init__(access_token=access_token, base_url=base_url)

    def get_all(self) -> list[User]:
        return [json_to_user(x) for x in self._get_all_users()]

    def get_users_by_id(self, user_ids: list[str] = []) -> list[User]:
        if len(user_ids) > 0:
            users = self._get_users_by_id(user_ids)
        else:
            users = self._get_all_users()
        return [json_to_user(x) for x in users]

    def update_item(self, user_id: str, update_data: dict) -> None:
        request = {}
        if 'first_name' in update_data:
            request['firstName'] = update_data['first_name']
        if 'last_name' in update_data:
            request['lastName'] = update_data['last_name']
        if 'is_active' in update_data:
            request['enabled'] = update_data['is_active']
        if 'cellular_number' in update_data:
            request['attributes'] = {
                'cellularNumber': [update_data['cellular_number']]
            }
        url = self.build_url("users", user_id)
        self._put(url, body=request)

    def _get_users_by_id(self, user_ids: list[str] = []) -> list[dict]:
        def get_user(id):
            url = self.build_url("users", id)
            return self._get(url).json()

        return [get_user(x) for x in user_ids]

    def _get_all_users(self) -> list[dict]:
        url = self.build_url("users")
        return self._get(url).json()
