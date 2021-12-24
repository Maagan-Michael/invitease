from datetime import datetime, timedelta

from sqlalchemy.sql.elements import or_
from fastapi import APIRouter
from database import InvitationRepository, create_connection, models, Invitation, UsersRepository,User
from fastapi import APIRouter, Depends, Path
from sqlalchemy import DateTime, or_
from pydantic import BaseModel
from database import UsersRepository
from utilities import *



router = APIRouter(prefix="/guard", tags=["guard"])


def create_invitations_list():
    connection = create_connection()
    return InvitationRepository(connection)


@router.get("/invitations", summary="Gets all the active invitations.")
def read_invitations(invitations: InvitationRepository = Depends(create_invitations_list)):
    today = datetime.today().strftime("%Y-%m-%d")
    tomorrowRaw: datetime = datetime.today() + timedelta(days=2)
    tomorrow = tomorrowRaw.strftime("%Y-%m-%d")
    time_limit: datetime = (datetime.utcnow()-timedelta(hours=2)).strftime("%Y-%m-%dT%H:%M")

    return invitations.query(lambda x: x.filter(or_(Invitation.is_active == True, Invitation.modify_timestamp >=time_limit), Invitation.invitees_arrival_timestamp >= today, Invitation.invitees_arrival_timestamp <= tomorrow))

@router.get("/user-name/{user_id}", summary="Gets all the users.")
def read_user_name(users: UsersRepository = Depends(create_users_repository), user_id: str = None ):
    userList:list(User) = users.query(lambda x: x.filter(User.user_id == user_id))
    user:User = userList[0]
    fullName:str = f'{user.first_name} {user.last_name}'
    return  fullName


class UpdateInviteesRequest(BaseModel):
    invitees_admitted: int


@router.post("/change_admitted/{invitation_id}", summary="Updates the invitation information.")
def update_user(request: UpdateInviteesRequest,  invitation: InvitationRepository = Depends(create_invitations_list),
                invitation_id: str = Path(None, description="The unique identifier of the invitation."),):

    update_data = request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    invitation.update_item(invitation_id, update_data)

