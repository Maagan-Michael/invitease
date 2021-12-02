from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy.types import DateTime
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base

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
    
class Invitation(Base):
    __tablename__ = 'invitations'

    invitation_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False)
    user_id = Column(UUID(as_uuid=True))
    invitees_amount = Column(Integer, nullable=False)
    invitees_admitted = Column(Integer, nullable=False)
    invitees_arrival_timestamp = DateTime(timezone=True)
    is_active = Column(Boolean, nullable=False)
    creation_timestamp = Column(DateTime(timezone=True), nullable=False)
    modify_timestamp = Column(DateTime(timezone=True), nullable=False)
    comment_for_guard = Column(String)

class EventLogEntry(Base):
    __tablename__ = 'event_log'

    event_id = Column(UUID(as_uuid=True), primary_key=True, nullable=False)
    event_timestamp = Column(DateTime(timezone=True), nullable=False)
    event_type = Column(String, nullable=False)
    amount_before = Column(Integer)
    amount_after = Column(Integer)
    user_id = Column(UUID(as_uuid=True))
    guard_id = Column(UUID(as_uuid=True))
    invitation_id = Column(UUID(as_uuid=True))