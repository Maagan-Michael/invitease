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
            
    def add_item(self, item):
        with Session(bind=self.connection) as session:
            session.add(item)
            session.commit()

    def add_all(self, items:list):
        with Session(bind=self.connection) as session:
            session.bulk_save_objects(items)
            session.commit()

    def get_by_id(self, item_id):
        with Session(bind=self.connection) as session:
            return session.query(self.table) \
                .filter(self.primay_key == item_id) \
                .first()

    def update_item(self, item_id, update_data: dict):
        with Session(bind=self.connection) as session:
            session.query(self.table) \
                .filter(self.primay_key == item_id) \
                .update(update_data)
            session.commit()

    def delete_item(self, item):
        with Session(bind=self.connection) as session:
            session.delete(item)
            session.commit()