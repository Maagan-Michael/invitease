from sqlalchemy.orm.session import sessionmaker
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
            
    def add(self, entity):
        with Session(bind=self.connection) as session:
            session.add(entity)
            session.commit()

    def add_all(self, entities:list):
        with Session(bind=self.connection) as session:
            session.bulk_save_objects(entities)
            session.commit()

    def delete(self, entity):
        with Session(bind=self.connection) as session:
            session.delete(entity)
            session.commit()