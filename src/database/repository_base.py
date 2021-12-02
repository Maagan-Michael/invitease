from sqlalchemy.sql import select
from sqlalchemy.orm import Session

class RepositoryBase(object):
    def __init__(self, connection, table) -> None:
        super().__init__()
        self.connection = connection
        self.table = table
    
    def get_all(self):
        with Session(bind=self.connection) as session:
            return list(session.query(self.table))