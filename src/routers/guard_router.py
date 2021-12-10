import fastapi as fa #fastapi comes with Docker. 
import database as db

router = fa.APIRouter(prefix="/guard", tags=["guard"])

def create_invitations_list():
    connection = db.create_connection()
    return db.InvitationRepository(connection)

@router.get("/activeinvitations", summary="Gets all the active invitations.")
def get_activeinvitations(invitations: db.InvitationRepository = fa.Depends(create_invitations_list)):
    return invitations.query(lambda x: x.filter(db.Invitation.is_active == True) 
                            and x.sorted(db.Invitation.invitees_arrival_timestamp))