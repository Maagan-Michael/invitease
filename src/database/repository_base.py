from sqlalchemy.orm import Session


class RepositoryBase(object):
    def __init__(self, connection, table, primary_key) -> None:
        super().__init__()
        self.connection = connection
        self.primary_key = primary_key
        self.table = table

    def get_all(self, query_options=()):
        return self.query(lambda x: x.options(query_options))

    def query(self, query):
        with Session(bind=self.connection) as session:
            return list(query(session.query(self.table)))

    def add_item(self, item):
        with Session(bind=self.connection) as session:
            session.add(item)
            session.commit()

    def add_all(self, items: list):
        with Session(bind=self.connection) as session:
            session.bulk_save_objects(items)
            session.commit()

    def get_by_id(self, item_id):
        with Session(bind=self.connection) as session:
            return session.query(self.table) \
                .filter(self.primary_key == item_id) \
                .first()

    def update_item(self, item_id, update_data: dict):
        with Session(bind=self.connection) as session:
            session.query(self.table) \
                .filter(self.primary_key == item_id) \
                .update(update_data)
            session.commit()

    def delete_item(self, item):
        with Session(bind=self.connection) as session:
            session.delete(item)
            session.commit()