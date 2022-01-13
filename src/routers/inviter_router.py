from fastapi import APIRouter, Depends, Path
from database import InvitationRepository, create_connection, models, Invitation
from datetime import datetime
from pydantic import BaseModel
from typing import Optional

router = APIRouter(prefix="/inviter", tags=["inviter"])


def create_invitations_list():
    connection = create_connection()
    return InvitationRepository(connection)


@router.get("/invitations", summary="Gets all the invitations for this user.")
def get_invitations(invitations: InvitationRepository = Depends(create_invitations_list), user_id: str = None):
    return invitations.get_user_relevant_invitations(user_id=user_id)


class CreateInvitationRequest(BaseModel):
    invitees_amount: Optional[int]
    invitees_arrival_timestamp_epoch: Optional[int]
    comment_for_guard: Optional[str]


@router.post("/invite", summary="Creates a new invitation for this user.")
def create_invitation(request: CreateInvitationRequest,
                      invitations: InvitationRepository = Depends(
                          create_invitations_list),
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


@router.post("/edit_invitation/{invitation_id}", summary="Updates the invitation information.")
def update_user(request: UpdateInvitationRequest, invitation: InvitationRepository = Depends(create_invitations_list),
                invitation_id: str = Path(None, description="The unique identifier of the invitation.")):

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

