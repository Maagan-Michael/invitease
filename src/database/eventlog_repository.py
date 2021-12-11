from database.repository_base import RepositoryBase
from database.models import EventLogEntry

class EventLogRepository(RepositoryBase):
    def __init__(self, connection) -> None:
        super().__init__(connection, EventLogEntry, EventLogEntry.event_id)
