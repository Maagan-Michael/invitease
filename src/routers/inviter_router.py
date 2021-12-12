from fastapi import APIRouter, Depends
from database import InvitationRepository, create_connection, models, Invitation
from datetime import datetime

router = APIRouter(prefix="/inviter", tags=["inviter"])

def create_invitations_list():
    connection = create_connection()
    return InvitationRepository(connection)

@router.get("/invitations", summary="Gets all the invitations for this user.")
def get_invitations(invitations: InvitationRepository = Depends(create_invitations_list), user_id: str = None):
    return invitations.query(lambda x: x.filter(Invitation.user_id == user_id))

@router.get("/invite", summary="Creates a new invitation for this user.")
def create_invitation(invitations: InvitationRepository = Depends(create_invitations_list), user_id: str = None, invitees_amount: int = None, invitees_arrival_timestamp_epoch: int = None,comment_for_guard: str =  None):
    new_invitation =  Invitation(
	user_id = user_id,
	invitees_amount = invitees_amount,
	invitees_arrival_timestamp = datetime.utcfromtimestamp(invitees_arrival_timestamp_epoch),
	comment_for_guard = comment_for_guard,
    )

    invitations.add_item(new_invitation)
    