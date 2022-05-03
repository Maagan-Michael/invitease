from datetime import datetime
from typing import Optional

from core.utilities import *
from database import InvitationRepository, Invitation
from fastapi import APIRouter, Depends, Path
from pydantic import BaseModel

router = APIRouter(prefix="/inviter", tags=["inviter"])


@router.get("/invitations", summary="Gets all the invitations for this user.")
def get_invitations(invitations: InvitationRepository = Depends(
        create_invitation_repository), user_id: str = None):
    return invitations.get_user_relevant_invitations(user_id=user_id)


class CreateInvitationRequest(BaseModel):
    invitees_amount: Optional[int]
    invitees_arrival_timestamp_epoch: Optional[int]
    comment_for_guard: Optional[str]


@router.post("/invite", summary="Creates a new invitation for this user.")
def create_invitation(request: CreateInvitationRequest,
                      invitations: InvitationRepository = Depends(
                          create_invitation_repository),
                      user_id: str = None):
    new_invitation = Invitation(
        user_id=user_id,
        invitees_amount=request.invitees_amount,
        invitees_arrival_timestamp=datetime.utcfromtimestamp(
            request.invitees_arrival_timestamp_epoch),
        comment_for_guard=request.comment_for_guard
    )

    invitations.add_item(new_invitation)


class UpdateInvitationRequest(BaseModel):
    invitees_amount: Optional[int]
    is_active: Optional[bool]
    comment_for_guard: Optional[str]


@router.post("/edit_invitation/{invitation_id}",
             summary="Updates the invitation information.")
def update_invitation(
    request: UpdateInvitationRequest,
    invitation: InvitationRepository = Depends(create_invitation_repository),
    invitation_id: str = Path(
        None,
        description="The unique identifier of the invitation.")):
    """
    Update the invitation with the specified identifier.
    <br />Available fields:
    - **invitees_amount**: The the amount of invited people.
    - **comment_for_guard**: The comment for the guard.
    - **is_active**: A flag indicating whether the invitation is active or not.
     """
    update_data = request.dict(exclude_unset=True)
    update_data['modify_timestamp'] = datetime.utcnow()
    invitation.update_item(invitation_id, update_data)
