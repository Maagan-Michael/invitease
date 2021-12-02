from sqlalchemy import Column, Integer, String, ForeignKey, Boolean
from sqlalchemy.types import DateTime
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'

    user_id = Column(UUID(as_uuid=True), primary_key=True)
    first_name = Column(String)
    last_name = Column(String)
    cellular_number = Column(String)
    email = Column(String)
    user_role = Column(String)
    creation_timestamp = DateTime(timezone=True)
    modify_timestamp = DateTime(timezone=True)

class Invitation(Base):
    __tablename__ = 'invitations'

    invitation_id = Column(UUID(as_uuid=True), primary_key=True)
    user_id = Column(UUID(as_uuid=True), ForeignKey('user.user_id'))
    invitees_amount = Column(Integer)
    invitees_admitted = Column(Integer)
    invitees_arrival_timestamp = DateTime(timezone=True)
    is_active = Column(Boolean)
    creation_timestamp = DateTime(timezone=True)
    modify_timestamp = DateTime(timezone=True)
    comment_for_guard = Column(String)