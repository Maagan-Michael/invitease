<p align="center">
  <img alt="Invitease logo" src="invitease_logo.svg"></img>
</p>

<p align="center"><img src="https://github.com/Maagan-Michael/invitease/actions/workflows/snyk-container-analysis.yml/badge.svg"></p>

### Description
A self contained invitation management system for gatekeeping.
### Purpose
Serves as a focal point for inviting guests to a venue protected by guarded gate.
### Infrastructure
The project is written in Python with PostgreSQL database on top of Docker.

Web service management is done with `uvicorn` running `FastAPI`.

Database access is managed with `psycopg2` and `SQLAlchemy` (Soon `alembic` implementation will manage the schema versioning).
### First run
The project dependencies are Docker and docker-compose.
- First `clone` the project locally.
- `cd` into the project folder.
- Run: `docker-compose up -d`
- Voila! The app is now accessible in your browser: http://invitease.localhost/
### Database
The database schema is automatically generated when the Postgres docker is loaded, the relevant files are in `db/init`.

Sometimes after playing with the database you may want to start clean (By running `docker-compose down -v`).

The database is stored inside a docker volume, configured inside the `docker-compose.yml`.

In order to remove all the data all you have to do is to remove the volume completely, it will be automatically recreated when `docker-compose up` is invoked.
### Troubleshooting FAQ
#### Are all the dockers running?
- Running `docker-compose ps` will display a list of all the currently running containers
#### How can I see the application logs?
- Running `docker-compose logs app` will display the latest log output from the relevant `app` container.

### Documentation
Our [https://github.com/Maagan-Michael/invitease/wiki](Wiki) is a good place to start.

### Legal
Logo was contributed by [Stockio.com](https://www.stockio.com/free-icon/wedding-icons-invitation-card).

##### Made with :heart: by members and friends of Kibbutz Ma'agan Michael.

