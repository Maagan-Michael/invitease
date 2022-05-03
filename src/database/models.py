from database.models_data import event_log_entry_info
from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base, relationship
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy.types import DateTime

Base = declarative_base()


class User(object):
    def __init__(self, **kargs) -> None:
        self.user_id = kargs.get('user_id')
        self.first_name = kargs.get('first_name')
        self.last_name = kargs.get('last_name')
        self.cellular_number = kargs.get('cellular_number')
        self.email = kargs.get('email')
        self.user_role = kargs.get('user_role')
        self.creation_timestamp = kargs.get('creation_timestamp')
        self.modify_timestamp = kargs.get('modify_timestamp')
        self.is_active = kargs.get('is_active')


class Invitation(Base):
    __tablename__ = 'invitations'

    invitation_id = Column(
        UUID(
            as_uuid=True),
        primary_key=True,
        nullable=False,
        server_default='uuid_generate_v4()')
    user_id = Column(UUID(as_uuid=True))
    invitees_amount = Column(Integer, nullable=False)
    invitees_admitted = Column(Integer, nullable=False, server_default="0")
    invitees_arrival_timestamp = Column(
        DateTime(timezone=True), nullable=False)
    is_active = Column(Boolean, nullable=False, default=True)
    creation_timestamp = Column(
        DateTime(
            timezone=True),
        nullable=False,
        server_default='NOW()')
    modify_timestamp = Column(
        DateTime(
            timezone=True),
        nullable=False,
        server_default='NOW()')
    comment_for_guard = Column(String)


class EventLogEntry(Base):
    __tablename__ = 'event_log'

    event_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False,
                      server_default='uuid_generate_v4()')
    event_timestamp = Column(
        DateTime(timezone=True),
        nullable=False,
        info=event_log_entry_info.event_timestamp, server_default='NOW()'
    )
    event_type = Column(
        String,
        nullable=False,
        info=event_log_entry_info.event_type
    )
    amount_before = Column(Integer, info=event_log_entry_info.amount_before)
    amount_after = Column(Integer, info=event_log_entry_info.amount_after)
    user_id = Column(
        UUID(as_uuid=True),
        info=event_log_entry_info.user_id
    )
    guard_id = Column(
        UUID(as_uuid=True),
        info=event_log_entry_info.guard_id
    )
    invitation_id = Column(
        UUID(as_uuid=True),
        ForeignKey("invitations.invitation_id"),
        info=event_log_entry_info.invitation_id
    )
    invitation = relationship("Invitation")
