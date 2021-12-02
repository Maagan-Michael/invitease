CREATE EXTENSION IF NOT EXISTS "uuid-ossp";  

CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_in', 'guard_out');
CREATE TYPE role_type AS ENUM ('user', 'guard', 'admin');

CREATE DOMAIN cellno AS TEXT CHECK (VALUE ~* '^0[0-9]{8,9}$');

create table users(
	user_id UUID NOT NULL DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	cellular_number cellno NULL,
	email VARCHAR(255) NULL,
	user_role role_type NOT NULL DEFAULT 'user',
	creation_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	modify_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	PRIMARY KEY(user_id)
);

create table invitations(
	invitation_id UUID NOT NULL DEFAULT uuid_generate_v4(),
	user_id UUID NOT NULL REFERENCES users (user_id),
	invitees_amount INT NOT NULL,
	invitees_admitted INT NOT NULL,
	invitees_arrival_timestamp TIMESTAMPTZ NULL,
	is_active BOOLEAN NOT NULL,
	creation_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	modify_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	comment_for_guard TEXT NULL,
	PRIMARY KEY (invitation_id)
);

create table event_log(
	event_id UUID NOT NULL DEFAULT uuid_generate_v4(),
	event_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	event_type event_type NOT NULL,
	amount_before INT NULL,
	amount_after INT NULL,
	user_id UUID NULL REFERENCES users (user_id),
	guard_id UUID NULL REFERENCES users (user_id),
	invitation_id UUID NULL REFERENCES invitations (invitation_id),
	PRIMARY KEY(event_id)
);

/* Mock data */

INSERT INTO users(first_name,last_name,cellular_number)
VALUES
	('Israel','Israeli','0524443333'),
	('Israel','Israelovich','054111333');


INSERT INTO event_log(event_time,guard_id,event_type,amount_before,amount_after)
VALUES
	(NOW(),1,'entered',4,5),
	(NOW(),2,'cancelled',3,4);
