CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_in', 'guard_out');

CREATE DOMAIN cellno AS TEXT CHECK (VALUE ~* '^0[0-9]{8,9}$');

create table users(
	user_id SERIAL,
    first_name TEXT,
	last_name TEXT,
	cellular_number cellno,
	email TEXT
);

create table invitations(
	invitation_id INT GENERATED ALWAYS AS IDENTITY,
	user_id INT NOT NULL,
	invitees_amount INT,
	invitees_admited INT,
	invitees_arrival_time TIMESTAMPTZ,
	active BOOLEAN NOT NULL,
	creation_time TIMESTAMPTZ,
	mod_time TIMESTAMPTZ,
	comment TEXT,
	PRIMARY KEY (invitation_id)
);

create table guards(
	guard_id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
	guard_name VARCHAR(16)
  
);

create table event_log(
	event_id INT GENERATED ALWAYS AS IDENTITY,
	event_time TIMESTAMPTZ NOT NULL,
	event_type event_type NOT NULL,
	amount_before INT,
	amount_after INT,
	summoner VARCHAR(100),
	guard_id INT REFERENCES guards (guard_id),
	invitation_id VARCHAR(16)
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
