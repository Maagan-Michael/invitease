from datetime import datetime
from typing import List, Optional

from core.utilities import *
from database import InvitationRepository, User
from fastapi import APIRouter, Depends, Path
from fastapi import Query
from pydantic import BaseModel

router = APIRouter(prefix="/guard", tags=["guard"])


@router.get("/invitations", summary="Gets all the active invitations.")
def get_invitations(invitations: InvitationRepository = Depends(create_invitation_repository)):
    return invitations.get_pendind_invitations()


@router.get("/user_names", summary="Gets user names by their id.")
def get_user_names(users: KeycloakUserRepository = Depends(create_users_repository),
                    user_ids: Optional[List[str]] = Query([])):
    users: list(User) = users.get_user_by_id(user_ids=user_ids)
    def to_map(user: User) -> dict:
        return {'user_id': user.user_id, 'first_name': user.first_name, 'last_name': user.last_name}
    result = [to_map(x) for x in users]
    return result


class UpdateInviteesRequest(BaseModel):
    invitees_admitted: int


@router.post("/change_admitted/{invitation_id}", summary="Updates the invitation information.")
def change_admitted(request: UpdateInviteesRequest,
                    invitation: InvitationRepository = Depends(create_invitation_repository),
                    invitation_id: str = Path(None,
                                              description="The unique identifier of the invitation."), ):
    update_data = request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    invitation.update_item(invitation_id, update_data)
