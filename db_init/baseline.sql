CREATE EXTENSION IF NOT EXISTS "uuid-ossp";  

CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_in', 'guard_out');

CREATE DOMAIN cellno AS TEXT CHECK (VALUE ~* '^0[0-9]{8,9}$');

create table users(
	user_id UUID NOT NULL,
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	cellular_number cellno,
	email VARCHAR(255),
	creation_timestamp TIMESTAMPTZ,
	modify_timestamp TIMESTAMPTZ,
	PRIMARY KEY(user_id)
);

create table invitations(
	invitation_id UUID NOT NULL,
	user_id UUID NOT NULL REFERENCES users (user_id),
	invitees_amount INT NOT NULL,
	invitees_admited INT NOT NULL,
	invitees_arrival_time TIMESTAMPTZ,
	active BOOLEAN NOT NULL,
	creation_timestamp TIMESTAMPTZ,
	modify_timestamp TIMESTAMPTZ,
	comment_for_guard TEXT,
	PRIMARY KEY (invitation_id)
);

create table guards(
	guard_id UUID NOT NULL,
	guard_name VARCHAR(255) NOT NULL,
	creation_timestamp TIMESTAMPTZ,
	modify_timestamp TIMESTAMPTZ,
	PRIMARY KEY(guard_id)
);

create table event_log(
	event_id UUID NOT NULL,
	event_timestamp TIMESTAMPTZ NOT NULL,
	event_type event_type NOT NULL,
	amount_before INT,
	amount_after INT,
	summoner UUID REFERENCES users (user_id),
	guard_id UUID REFERENCES guards (guard_id),
	invitation_id UUID REFERENCES invitations (invitation_id),
	PRIMARY KEY(event_id)
);

/* Mock data */

INSERT INTO guards(guard_name)
VALUES
  	('Avraham'),
  	('Dafna');

INSERT INTO users(first_name,last_name,cellular_number)
VALUES
	('Israel','Israeli','0524443333'),
	('Israel','Israelovich','054111333');


INSERT INTO event_log(event_time,guard_id,event_type,amount_before,amount_after)
VALUES
	(NOW(),1,'entered',4,5),
	(NOW(),2,'cancelled',3,4);
