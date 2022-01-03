from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy.types import DateTime
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class User(Base):
    __tablename__ = 'users'

    user_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False, server_default='uuid_generate_v4()')
    first_name = Column(String(255), nullable=False)
    last_name = Column(String(255), nullable=False)
    cellular_number = Column(String)
    email = Column(String(255))
    user_role = Column(String, nullable=False, default='user')
    creation_timestamp = Column(DateTime(timezone=True), nullable=False, server_default='NOW()')
    modify_timestamp = Column(DateTime(timezone=True), nullable=False, server_default='NOW()')
    is_active = Column(Boolean, nullable=False, default=True)
    
class Invitation(Base):
    __tablename__ = 'invitations'

    invitation_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False, server_default='uuid_generate_v4()')
    user_id = Column(UUID(as_uuid=True), nullable=False)
    invitees_amount = Column(Integer, nullable=False)
    invitees_admitted = Column(Integer, nullable=False, default=0)
    invitees_arrival_timestamp = Column(DateTime(timezone=True), nullable=False)
    is_active = Column(Boolean, nullable=False, default=True)
    creation_timestamp = Column(DateTime(timezone=True), nullable=False,server_default='NOW()')
    modify_timestamp = Column(DateTime(timezone=True), nullable=False,server_default='NOW()')
    comment_for_guard = Column(String)
    # user = relationship("User", back_populates="invitations")


class EventLogEntry(Base):
    __tablename__ = 'event_log'

    event_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False, server_default='uuid_generate_v4()')
    event_timestamp = Column(DateTime(timezone=True), nullable=False, server_default='NOW()')
    event_type = Column(String, nullable=False)
    amount_before = Column(Integer)
    amount_after = Column(Integer)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.user_id"))
    guard_id = Column(UUID(as_uuid=True), ForeignKey("users.user_id"))
    invitation_id = Column(UUID(as_uuid=True), ForeignKey("invitations.user_id"))
    user = relationship("User", primaryjoin="(EventLogEntry.user_id == User.user_id)")
    guard = relationship("User", primaryjoin="(EventLogEntry.guard_id == User.user_id)")
    invitation = relationship("Invitation")

