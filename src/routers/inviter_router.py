from fastapi import APIRouter, Depends
from database import InvitationRepository, create_connection, models, Invitation

router = APIRouter(prefix="/inviter", tags=["inviter"])

def create_invitations_list():
    connection = create_connection()
    return InvitationRepository(connection)

@router.get("/invitations", summary="Gets all the invitations for this user.")
def get_invitations(invitations: InvitationRepository = Depends(create_invitations_list), user_id: str = None):
    return invitations.query(lambda x: x.filter(Invitation.user_id == user_id))