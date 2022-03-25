from datetime import datetime, timedelta

from database.models import Invitation
from database.repository_base import RepositoryBase
from sqlalchemy import or_


class InvitationRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, Invitation, Invitation.invitation_id)

    def get_pending_invitations(self):
        today = datetime.today().strftime("%Y-%m-%d")
        tomorrow: datetime = datetime.today() + timedelta(days=2)
        tomorrow_formatted = tomorrow.strftime("%Y-%m-%d")
        time_limit = (datetime.utcnow() - timedelta(hours=2)).strftime("%Y-%m-%dT%H:%M")

        return self.query(lambda x: x.filter(
            or_(Invitation.is_active == True, Invitation.modify_timestamp >= time_limit),
            Invitation.invitees_arrival_timestamp >= today,
            Invitation.invitees_arrival_timestamp <= tomorrow_formatted))

    def get_user_relevant_invitations(self, user_id: str):
        today = datetime.today().strftime("%Y-%m-%d")

        return self.query(lambda x: x.filter(
            Invitation.user_id == user_id,
            Invitation.is_active == True,
            Invitation.invitees_arrival_timestamp >= today))
