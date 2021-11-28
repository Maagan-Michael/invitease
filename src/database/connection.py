from os import getenv
from sqlalchemy.engine.create import create_engine

def create_connection():
    connection_string = getenv("IVT_CONNECTION_STRING","")
    if not connection_string:
        connection_string ="dbname=invitease user=invitease host=db password=password" 
    engine = create_engine(connection_string)
    return engine
