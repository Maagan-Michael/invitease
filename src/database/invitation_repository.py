from database.repository_base import RepositoryBase
from database.models import Invitation

class InvitationRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, Invitation, Invitation.invitation_id)
