from sqlalchemy.orm.session import sessionmaker
from sqlalchemy.sql import select
from sqlalchemy.orm import Session
from sqlalchemy.sql.expression import update

class RepositoryBase(object):
    def __init__(self, connection, table, primary_key) -> None:
        super().__init__()
        self.connection = connection
        self.primay_key = primary_key
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

    def update(self, entity_id, update_data: dict):
        with Session(bind=self.connection) as session:
            session.query(self.table) \
                .filter(self.primay_key == entity_id) \
                .update(update_data)
            session.commit()
            
    def delete(self, entity):
        with Session(bind=self.connection) as session:
            session.delete(entity)
            session.commit()