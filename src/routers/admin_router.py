import csv
from datetime import datetime
from io import StringIO
from typing import Optional
from uuid import UUID

from core.authentication import require_roles
from core.utilities import *
from database import EventLogEntry
from database.events_repository import EventsLogRepository
from fastapi import APIRouter, Depends, Path
from pydantic import BaseModel
from sqlalchemy.orm import joinedload
from starlette.responses import StreamingResponse

router = APIRouter(prefix="/admin", tags=["admin"])


@router.get("/users", summary="Gets all the users.")
@require_roles(roles=["admin"])
def read_users(users: KeycloakUserRepository = Depends(create_users_repository)):
    return users.get_all()


class UpdateUserRequest(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    cellular_number: Optional[str]
    email: Optional[str]
    is_active: Optional[bool]


@router.post("/users/{user_id}", summary="Updates the user information.")
@require_roles(roles=["admin"])
def update_user(update_request: UpdateUserRequest,
                  user_id: str = Path(
                      None, description="The unique identifier of the user."),
                  users: KeycloakUserRepository = Depends(create_users_repository)):
    """
    Update the user with the specified identifier.
    <br />Available fields:
    - **first_name**: The first name of the user.
    - **last_name**: The last name of the user.
    - **cellular_number**: The cellular number of the user.
    - **email**: The E-Mail of the user.
    - **is_active**: A flag indicating whether the user is active or not.
    """

    update_data = update_request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    users.update_item(user_id, update_data)


@router.post("/users/{user_id}/role/{user_role}", summary="Update the user role.")
@require_roles(roles=["admin"])
def set_user_role(user_id: str = Path(None, description="The unique identifier of the user."),
                  user_role: str = Path(
                      None, description="The new role to assign to the user."),
                  users: KeycloakUserRepository = Depends(create_users_repository)):
    """
    Update the user role of the user with the specified identifier.
    """
    users.set_user_role(user_id, user_role)


@ router.get("/eventlogs/export", summary="Exports all events to csv format.")
@ require_roles(roles=["admin"])
def export_eventlogs(event_logs: EventsLogRepository = Depends(create_eventlog_repository), users: KeycloakUserRepository = Depends(create_users_repository)):
    """
    Exports all events to csv format.
    """
    output = StringIO()
    headers = ExportLogsGenerator.get_prepared_headers()
    writer = csv.DictWriter(
        output,
        fieldnames=list(headers.values()),
        quoting=csv.QUOTE_ALL
    )
    writer.writeheader()
    logs = event_logs.get_all((
        joinedload(EventLogEntry.invitation)
    ))
    if len(logs) == 0:
        return "No Content"

    for row_data in ExportLogsGenerator.prepare_logs(headers, logs, users):
        writer.writerow(row_data)

    response = StreamingResponse(iter([output.getvalue()]),
                                 media_type="text/plain"
                                 )

    response.headers[
        "Content-Disposition"] = f"attachment; filename=event_log_{datetime.utcnow().strftime('%Y-%m-%d')}.csv"

    return response


class ExportLogsGenerator:
    @classmethod
    def headers_to_export(cls) -> list[str]:
        return ['event_timestamp', 'event_type', 'amount_before',
                'amount_after', 'user_id', 'guard_id', 'invitation_id']

    @classmethod
    def prepare_headers(cls, headers: list[str]) -> dict[str, str]:
        return translate_export_headers(headers, EventLogEntry)

    @classmethod
    def get_prepared_headers(cls) -> dict[str, str]:
        headers = ExportLogsGenerator.headers_to_export()
        return ExportLogsGenerator.prepare_headers(headers)

    @classmethod
    def get_user_name_by_id(cls, user_id: UUID, users: KeycloakUserRepository) -> str:
        result = users.get_users_by_id([str(user_id)])
        user = next(iter(result), None)
        if user.first_name is None:
            return user.last_name
        if user.last_name is None:
            return user.first_name
        return user.last_name + ', ' + user.first_name

    @classmethod
    def get_row_content(cls, row: EventLogEntry, header: str, users: KeycloakUserRepository) -> str:
        if header == 'user_id' and row.__dict__['user_id'] is not None:
            return ExportLogsGenerator.get_user_name_by_id(row.user_id, users)
        if header == 'guard_id' and row.__dict__['guard_id'] is not None:
            return ExportLogsGenerator.get_user_name_by_id(row.guard_id, users)
        return row.__dict__[header]

    @classmethod
    def prepare_logs(cls, headers: dict[str, str], logs: list[EventLogEntry], users: KeycloakUserRepository) -> dict[str, str]:
        for row in logs:
            row_data = {
                headers[x]: ExportLogsGenerator.get_row_content(row, x, users)
                for x in headers.keys()
            }
            yield row_data
