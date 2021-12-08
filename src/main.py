import datetime
from re import A
from typing import List, Optional
from fastapi.param_functions import Depends
import psycopg2
from fastapi import FastAPI, Form, Request
from fastapi.templating import Jinja2Templates
from sqlalchemy import create_engine, log  # , engine
from sqlalchemy import text
from datetime import date

from sqlalchemy.orm import raiseload
from starlette.responses import Response
from routers import admin_router, guard_router, inviter_router
from fastapi.middleware.cors import CORSMiddleware
from authentication import init_authentication
import os

app = FastAPI()
app.middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(admin_router)
app.include_router(guard_router)
app.include_router(inviter_router)

if(os.environ.get('IVT_ENABLE_AUTH') == 'true'):
    init_authentication(app)
# templates = Jinja2Templates(directory='src/templates/')

# Samples:
# con = psycopg2.connect("dbname=invitease user=invitease host=localhost password=password")

# cur = con.cursor()

# engine = create_engine("postgresql://invitease:password@localhost:5432/invitease")

# @app.get("/")
# def read_root():

#     connection =  engine.connect()
#     result = connection.execute(text("SELECT * FROM guards"))
#     a = result.all()
#     return {"Hello": a }


# @app.get("/items/{item_id}")
# def read_item(item_id: int, q: Optional[str] = None, s: Optional[str] = None):
#     return {"item_id": item_id, "q": q, "g": s}


# @app.get('/db/table/')
# def form_post(request: Request):
#     result = 'Choose a table'
#     return templates.TemplateResponse('view_tables.html', context={'request': request, 'result': result})

# @app.post("/db/table/")
# def form_post(request: Request,table_name: str = Form(...)):
#     cur.execute(f"SELECT * FROM {table_name};")

#     result = cur.fetchall()

#     return templates.TemplateResponse('view_tables.html', context={'request': request, 'result': result, 'table_name': table_name})

#     # return {"{table} table": cur.fetchall()}


# @app.get("/db/add/{table}/{column}/{value}")
# def read_item(table: str,column:str,value:str):
#      cur.execute(f"INSERT INTO {table} ({column}) VALUES ('{value}');")
#      return f'{value} added to {table}'

# @app.post("/db-test2/")
# async def example(request: Request):
#     form_data = await request.form()
#     return form_data

# @app.get('/db/add_guard')
# def form_post(request: Request):
#     result = 'Add a guard'
#     return templates.TemplateResponse('add_guard.html', context={'request': request, 'result': result})


# @app.post('/db/add_guard')
# def form_post(request: Request, guard_name: str = Form(...)):

#     connection =  engine.connect()
#     transaction = connection.begin()
#     result = connection.execute(text(f"INSERT INTO guards (guard_name) VALUES ('{guard_name}');"))
#     transaction.commit()

#     # cur.execute(f"INSERT INTO guards (guard_name) VALUES ('{guard_name}');")
#     # con.commit()
#     result = f'{guard_name} has been added as a guard'
#     return templates.TemplateResponse('add_guard.html', context={'request': request, 'result': result, 'guard_name': guard_name})

# @app.get('/db/invite_guests')
# def form_post(request: Request):
#     result = 'Invite a guest'
#     return templates.TemplateResponse('invite_guests.html', context={'request': request, 'result': result})


# @app.post('/db/invite_guests')
# def form_post(request: Request, invitees_amount: str = Form(...)):

#     currentDate = datetime.datetime.now()
#     connection =  engine.connect()
#     transaction = connection.begin()
#     result = connection.execute(text(f"INSERT INTO invitations (user_id,invitees_amount,invitees_admited,invitees_arrival_time,active,creation_time,mod_time,comment) VALUES (1,'{invitees_amount}',0,'{currentDate}',TRUE,'{currentDate}','{currentDate}','hello world');"))
#     transaction.commit()

#     # cur.execute(f"INSERT INTO guards (guard_name) VALUES ('{guard_name}');")
#     # con.commit()
#     result = f'You have invited {invitees_amount} guests. Welcome!'
#     return templates.TemplateResponse('add_guard.html', context={'request': request, 'result': result, 'invitees_amount': invitees_amount})
