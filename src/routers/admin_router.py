from fastapi import APIRouter

router = APIRouter(prefix="/admin", tags=["admin"])


@router.get("/users", tags=["users"])
def read_users():
    return [{"username": "Rick"}, {"username": "Morty"}]
