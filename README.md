<p align="center">
  <img alt="Invitease logo" style="border-radius:15px;"src="https://raw.githubusercontent.com/Maagan-Michael/invitease/master/invitease_logo.svg"></img>
</p>

### Description
A self contained invitation management system for gatekeeping.
### Purpose
Serves as a focal point for inviting guests to a venue protected by guarded gate.
### Infrastructure
The project is written in Python with PostgreSQL database on top of Docker.

Web service management is done with `uvicorn` running `FastAPI`.

Database access is managed with `psycopg2` and `SQLAlchemy` (Soon `alembic` implementation will manage the schema versioning).
`FastAPI` template type is `jinja2`.
### First run
The project dependencies are Docker and docker-compose.
- First `clone` the project locally.
- `cd` into the project folder.
- Run: `docker-compose up -d`
- The app is now accessible using port 8080 in your browser: http://localhost:8080/
- Voila!
### Database
The database schema is automatically generated when the Postgres docker is loaded, the relevant files are in `db_init`.

Sometimes after playing with the database you may want to start clean.

The database is stored inside a docker volume, configured inside the `docker-compose.yml`.

In order to remove all the data all you have to do is to remove the volume completely, it will be automatically recreated when `docker-compose up` is invoked.
### Troubleshooting FAQ
#### Are all the dockers running?
- Running `docker-compose ps` will display a list of all the currently running containers
#### How can I see the application logs?
- Running `docker-compose logs app` will display the latest log output from the relevant `app` container.
#### Port is inaccesible
- Every operating system behaves differently but we need to see that 8080 is listening:
  - Linux: `netstat -ntlp | grep 8080`
  - Mac: `netstat -an -ptcp | awk '$NF == "LISTEN" && /8080/ {print}'`
  - Windows: `netstat -aof | findstr :8080`
If it's not there's either a problem with our Docker installation or the relevant definition disappeared from `docker-compose.yml`.

Made with :heart: by members and friends of Kibbutz Ma'agan Michael.

