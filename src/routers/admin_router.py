from datetime import datetime
from fastapi import APIRouter, Depends, Path
from database import UsersRepository, create_connection
from pydantic import BaseModel
from typing import Optional

router = APIRouter(prefix="/admin", tags=["admin"])


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)


@router.get("/users", summary="Gets all the users.")
def read_users(users: UsersRepository = Depends(create_users_repository)):
    return users.get_all()


class UpdateUserRequest(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    cellular_number: Optional[str]
    email: Optional[str]
    is_active: Optional[bool]


@router.post("/users/{user_id}", summary="Updates the user information.")
def update_user(request: UpdateUserRequest, user_id: str = Path(None, description="The unique identifier of the user."), users: UsersRepository = Depends(create_users_repository)):
    """
    Update the user with the specified identifier.
    <br />Available fields:
    - **first_name**: The first name of the user.
    - **last_name**: The last name of the user.
    - **cellular_number**: The cellular number of the user.
    - **email**: The E-Mail of the user.
    - **is_active**: A flag indicating whether the user is active or not.
    """
    update_data = request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    users.update_item(user_id, update_data)


@router.post("/users/{user_id}/role/{role_type}", summary="Update the user role.")
def update_user(user_id: str = Path(None, description="The unique identifier of the user."), role_type: str = Path(None, description="The new role to assign to the user."), users: UsersRepository = Depends(create_users_repository)):
    """
    Update the user role of the user with the specified identifier.
    """
    update_data = {
        'modify_timestamp': datetime.utcnow(),
        'role_type': role_type
    }
    users.update_item(user_id, update_data)
