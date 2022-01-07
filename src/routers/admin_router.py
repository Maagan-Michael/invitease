from datetime import datetime
from sqlalchemy.orm import joinedload
from sqlalchemy.sql.sqltypes import DateTime
from fastapi import APIRouter, Depends, Path
from starlette.responses import StreamingResponse
from database import UsersRepository
from pydantic import BaseModel
from typing import Optional
from database.events_repository import EventsLogRepository
from core.utilities import *
import csv
from io import StringIO
from database import EventLogEntry
from core.authentication import require_roles

router = APIRouter(prefix="/admin", tags=["admin"])


@router.get("/users", summary="Gets all the users.")
@require_roles(roles=["admin"])
def read_users(users: UsersRepository = Depends(create_users_repository)):
    return users.get_all()


class UpdateUserRequest(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    cellular_number: Optional[str]
    email: Optional[str]
    is_active: Optional[bool]


@router.post("/users/{user_id}", summary="Updates the user information.")
@require_roles(roles=["admin"])
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
@require_roles(roles=["admin"])
def update_user(user_id: str = Path(None, description="The unique identifier of the user."), role_type: str = Path(None, description="The new role to assign to the user."), users: UsersRepository = Depends(create_users_repository)):
    """
    Update the user role of the user with the specified identifier.
    """
    update_data = {
        'modify_timestamp': datetime.utcnow(),
        'role_type': role_type
    }
    users.update_item(user_id, update_data)


@router.get("/eventlogs/export", summary="Exports all events to csv format.")
@require_roles(roles=["admin"])
def export_eventlogs(event_logs: EventsLogRepository = Depends(create_eventlog_repository)):
    """
    Exports all events to csv format.
    """
    output = StringIO()
    headers = ['event_timestamp', 'event_type', 'amount_before',
               'amount_after', 'user_id', 'guard_id', 'invitation_id']
    headers = translate_export_headers(headers, EventLogEntry)
    writer = csv.DictWriter(
        output,
        fieldnames=list(headers.values()),
        quoting=csv.QUOTE_ALL
    )
    writer.writeheader()
    logs = event_logs.get_all((
        joinedload(EventLogEntry.guard),
        joinedload(EventLogEntry.user),
        joinedload(EventLogEntry.invitation),
    ))
    if len(logs) == 0:
        return "No Content"

    for row in logs:
        row_data = {
            headers[x]: get_row_content(row.__dict__, x)
            for x in row.__dict__.keys()
            if x in headers
        }
        writer.writerow(row_data)

    response = StreamingResponse(iter([output.getvalue()]),
                                 media_type="text/plain"
                                 )

    response.headers["Content-Disposition"] = f"attachment; filename=event_log_{datetime.utcnow().strftime('%Y-%m-%d')}.csv"

    return response


def get_row_content(row: dict, header: str):
    if header == 'user_id' and row['user'] is not None:
        return row['user'].last_name + ', ' + row['user'].first_name
    if header == 'guard_id' and row['guard'] is not None:
        return row['guard'].last_name + ', ' + row['guard'].first_name
    return row[header]
