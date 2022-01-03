from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy.types import DateTime
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base, relationship
from database.models_data import event_log_entry_info

Base = declarative_base()


class User(Base):
    __tablename__ = 'users'

    user_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False)
    first_name = Column(String(255), nullable=False)
    last_name = Column(String(255), nullable=False)
    cellular_number = Column(String)
    email = Column(String(255))
    user_role = Column(String, nullable=False)
    creation_timestamp = Column(DateTime(timezone=True), nullable=False)
    modify_timestamp = Column(DateTime(timezone=True), nullable=False)
    is_active = Column(Boolean, nullable=False)
    invitations = relationship("Invitation", back_populates="user")


class Invitation(Base):
    __tablename__ = 'invitations'

    invitation_id = Column(
        UUID(as_uuid=True), primary_key=True, nullable=False)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.user_id"))
    invitees_amount = Column(Integer, nullable=False)
    invitees_admitted = Column(Integer, nullable=False)
    invitees_arrival_timestamp = DateTime(timezone=True)
    is_active = Column(Boolean, nullable=False)
    creation_timestamp = Column(DateTime(timezone=True), nullable=False)
    modify_timestamp = Column(DateTime(timezone=True), nullable=False)
    comment_for_guard = Column(String)
    user = relationship("User", back_populates="invitations")


class EventLogEntry(Base):
    __tablename__ = 'event_log'

    event_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False)
    event_timestamp = Column(
        DateTime(timezone=True),
        nullable=False,
        info=event_log_entry_info.event_timestamp
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
        ForeignKey("users.user_id"),
        info=event_log_entry_info.user_id
    )
    guard_id = Column(
        UUID(as_uuid=True),
        ForeignKey("users.user_id"),
        info=event_log_entry_info.guard_id
    )
    invitation_id = Column(
        UUID(as_uuid=True),
        ForeignKey("invitations.user_id"),
        info=event_log_entry_info.invitation_id
    )
    user = relationship(
        "User", primaryjoin="(EventLogEntry.user_id == User.user_id)")
    guard = relationship(
        "User", primaryjoin="(EventLogEntry.guard_id == User.user_id)")
    invitation = relationship("Invitation")
