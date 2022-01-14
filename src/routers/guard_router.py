from datetime import datetime, timedelta
from typing import List, Optional

from sqlalchemy.sql.elements import or_
from fastapi import APIRouter
from database import InvitationRepository, create_connection, models, Invitation, UsersRepository,User
from fastapi import APIRouter, Depends, Path
from pydantic import BaseModel
from database import UsersRepository
from core.utilities import *
from fastapi import Query

router = APIRouter(prefix="/guard", tags=["guard"])





@router.get("/invitations", summary="Gets all the active invitations.")
def read_invitations(invitations: InvitationRepository = Depends(create_invitations_list)):
    return invitations.get_pendind_invitations()

@router.get("/user_names", summary="Gets all the user names from a list of user-id's  ")
def read_user_names(users: UsersRepository = Depends(create_users_repository),
                    user_id_list: Optional[List[str]] = Query(None)):
    userList:list(User) = users.get_users_from_id_list(user_id_list=user_id_list)
    dictList:str = []
    for user in userList:
        newDict ={}
        newDict['user_id'] = user.user_id
        newDict['first_name'] = user.first_name
        newDict['last_name'] = user.last_name
        dictList.append(newDict)
    return dictList


class UpdateInviteesRequest(BaseModel):
    invitees_admitted: int


@router.post("/change_admitted/{invitation_id}", summary="Updates the invitation information.")
def change_admitted(request: UpdateInviteesRequest,  invitation: InvitationRepository = Depends(create_invitations_list),
                    invitation_id: str = Path(None, description="The unique identifier of the invitation."),):

    update_data = request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    invitation.update_item(invitation_id, update_data)

