from fastapi import APIRouter, Depends
from database.connection import create_connection
from database.users_repository import UsersRepository

router = APIRouter(prefix="/admin", tags=["admin"])

def create_users_repository():
    connection = create_connection()
    return UsersRepository(connection)

@router.get("/users", tags=["users"])
def read_users(users: UsersRepository = Depends(create_users_repository)):
     return users.get_all()
