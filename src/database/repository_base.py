class RepositoryBase(object):
    def __init__(self, connection, table_name) -> None:
        super().__init__()
        self.connection = connection
        self.table_name = table_name
    
    def get_all(self):
        return self.connection.execute(f"SELECT * FROM {self.table_name};")