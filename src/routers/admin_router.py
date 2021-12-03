from datetime import datetime
from fastapi import APIRouter, Depends
from database.connection import create_connection
from database.users_repository import UsersRepository
from pydantic import BaseModel
from typing import List, Optional

router = APIRouter(prefix="/admin", tags=["admin"])


def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)


@router.get("/users")
def read_users(users: UsersRepository = Depends(create_users_repository)):
    return users.get_all()


class UpdateUserRequest(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    cellular_number: Optional[str]
    email: Optional[str]
    is_active: Optional[bool]


@router.post("/users/{user_id}")
def update_user(user_id: str, request: UpdateUserRequest, users: UsersRepository = Depends(create_users_repository)):
    update_data = request.dict(exclude_unset=True)
    update_data ['modify_timestamp'] = datetime.utcnow()
    users.update_item(user_id, update_data)

@router.post("/users/{user_id}/role/{role_type}")
def update_user(user_id: str, role_type: str, users: UsersRepository = Depends(create_users_repository)):
    update_data = {
        'modify_timestamp': datetime.utcnow(),
        'role_type':role_type
    }
    users.update_item(user_id, update_data)
