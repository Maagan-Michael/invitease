from datetime import datetime

from sqlalchemy.sql.sqltypes import DateTime
from fastapi import APIRouter, Depends, Path
from starlette.responses import FileResponse
from database import UsersRepository
from pydantic import BaseModel
from typing import Optional
from database.events_repository import EventsLogRepository
from core.utilities import *
import csv
import io

router = APIRouter(prefix="/admin", tags=["admin"])


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


@router.get("/export_csv", summary="Gets all events in csv to admin")
def read_users(events: EventsLogRepository = Depends(create_events_entries)):

    fileName = "export_" + ".csv" # + datetime.utcnow()

    with open(fileName, 'w') as myfile:
        wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
        wr.writerow(events.get_all_csv())

    response = FileResponse(fileName,
                        media_type="text/csv"
    )

    response.headers["Content-Disposition"] = "attachment; filename=" + fileName

    return response