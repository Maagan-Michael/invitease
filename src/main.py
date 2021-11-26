from typing import List, Optional
import psycopg2
from fastapi import FastAPI,Form,Request
from fastapi.templating import Jinja2Templates
from sqlalchemy import create_engine #, engine
from sqlalchemy import text


mainFunc = FastAPI()
templates = Jinja2Templates(directory='src/templates/')

con = psycopg2.connect("dbname=invitease user=invitease host=db password=password")

cur = con.cursor()

engine = create_engine("postgresql://invitease:password@db:5432/invitease")

@mainFunc.get("/")
def read_root():
   
    connection =  engine.connect()
    result = connection.execute(text("SELECT * FROM guards"))
    a = result.all()
    return {"Hello": a }


@mainFunc.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None, s: Optional[str] = None):
    return {"item_id": item_id, "q": q, "g": s}


@mainFunc.get('/db/table/')
def form_post(request: Request):
    result = 'Choose a table'
    return templates.TemplateResponse('view_tables.html', context={'request': request, 'result': result})

@mainFunc.post("/db/table/")
def form_post(request: Request,table_name: str = Form(...)):
    cur.execute(f"SELECT * FROM {table_name};")

    result = cur.fetchall()
   
    return templates.TemplateResponse('view_tables.html', context={'request': request, 'result': result, 'table_name': table_name})

    # return {"{table} table": cur.fetchall()} 


@mainFunc.get("/db/add/{table}/{column}/{value}")
def read_item(table: str,column:str,value:str):
     cur.execute(f"INSERT INTO {table} ({column}) VALUES ('{value}');")
     return f'{value} added to {table}'

@mainFunc.post("/db-test2/")
async def example(request: Request):
    form_data = await request.form()
    return form_data
   
@mainFunc.get('/db/add_guard')
def form_post(request: Request):
    result = 'Add a guard'
    return templates.TemplateResponse('add_guard.html', context={'request': request, 'result': result})


@mainFunc.post('/db/add_guard')
def form_post(request: Request, guard_name: str = Form(...)):

    connection =  engine.connect()
    transaction = connection.begin()
    result = connection.execute(text(f"INSERT INTO guards (guard_name) VALUES ('{guard_name}');"))
    transaction.commit()
    
    # cur.execute(f"INSERT INTO guards (guard_name) VALUES ('{guard_name}');")
    # con.commit()
    result = f'{guard_name} has been added as a guard'
    return templates.TemplateResponse('add_guard.html', context={'request': request, 'result': result, 'guard_name': guard_name})

