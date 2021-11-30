CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; 
CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_shift_start', 'guard_shift_end');
CREATE TYPE user_level AS ENUM ('inviter','guard','moderator');
CREATE DOMAIN cellno AS TEXT CHECK (VALUE ~* '^0[0-9]{9}$');

create table users(
	user_id UUID NOT NULL,
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	cellular_number cellno,
	email VARCHAR(255),
	creation_timestamp TIMESTAMPTZ NOT NULL,
	modify_timestamp TIMESTAMPTZ,
	user_level user_level NOT NULL,
	active BOOLEAN NOT NULL,
	PRIMARY KEY(user_id)
);

create table invitations(
	invitation_id UUID NOT NULL,
	user_id REFERENCES users (user_id),
	invitees_amount INT,
	invitees_admitted INT,
	invitees_estimated_arrival_timestamp TIMESTAMPTZ NOT NULL,
	invitees_arrival_timestamp_end TIMESTAMPTZ NOT NULL,
	active BOOLEAN NOT NULL,
	creation_timestamp TIMESTAMPTZ NOT NULL,
	modify_timestamp TIMESTAMPTZ,
	comment_for_guard TEXT,
	PRIMARY KEY (invitation_id)
);

create table event_log(
	event_id UUID NOT NULL,
	event_timestamp TIMESTAMPTZ NOT NULL,
	event_type event_type NOT NULL,
	amount_before INT,
	amount_after INT,
	user_id REFERENCES users (user_id),
	guard_id REFERENCES users (user_id),
	invitation_id REFERENCES invitations (invitation_id),
	PRIMARY KEY (event_id)
);

/* Mock data */



INSERT INTO users(user_id,first_name,last_name,cellular_number,email,user_level,creation_timestamp,active)
VALUES
	(8-4-4-4-12,'Israel','Israeli','0524443333','coolkids@walla.co.ilz','inviter',NOW(),TRUE),
	('Israel','Israelovich','054111333','coolkids@walla.co.ilz','guard',NOW(),TRUE);


INSERT INTO invitations(invintation_id,invitees_amount,invitees_admitted,invitees_estimated_arrival_timestamp,invitees_arrival_timestamp_end,active,creation_timestamp,user_id,guard_id)
(ABCD1234-A123-4B12-11A1-4321DCBA1234,5,0,NOW() + 7h, NOW() + 20h,TRUE,NOW(),);
INSERT INTO event_log(event_timestamp,event_type,amount_before,amount_after)
VALUES
	(NOW()-5h,'entered',4,5),
	(NOW()-2h,'cancelled',5,4),
	(NOW(),'created',0,5),
	(NOW()-5h,'modified',4,5),
	(NOW()-2h,'guard_shift_start',NULL,NULL),
	(NOW(),'guard_shift_end',NULL,NULL);
