CREATE DATABASE keycloak;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";  

CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_in', 'guard_out');
CREATE TYPE role_type AS ENUM ('user', 'guard', 'admin');

CREATE DOMAIN cellno AS VARCHAR(20) CHECK (VALUE ~* '^0[0-9]{9}$');

create table users(
	user_id UUID NOT NULL DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	cellular_number cellno NULL,
	email VARCHAR(255) NULL,
	user_role role_type NOT NULL DEFAULT 'user',
	is_active BOOLEAN NOT NULL DEFAULT true,
	creation_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	modify_timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	PRIMARY KEY(user_id)
);

create table invitations(
	invitation_id UUID NOT NULL DEFAULT uuid_generate_v4(),
	user_id UUID NOT NULL REFERENCES users (user_id),
	invitees_amount INT NOT NULL,
	invitees_admitted INT NOT NULL DEFAULT 0,
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

INSERT INTO users(user_id,first_name,last_name,cellular_number)
VALUES
	('ce170212-7242-4f56-9298-d84b521eaedd','Israel','Israeli','0524443333'),
	('c397aebd-9cfe-47d1-9f1c-75aab323daf5','Israel','Israelovich','0541113334');


INSERT INTO event_log(event_timestamp,guard_id,event_type,amount_before,amount_after)
VALUES
	(NOW(),'ce170212-7242-4f56-9298-d84b521eaedd','entered',4,5),
	(NOW(),'c397aebd-9cfe-47d1-9f1c-75aab323daf5','cancelled',3,4);

INSERT INTO invitations(invitation_id,user_id,invitees_amount,invitees_admitted,invitees_arrival_timestamp,is_active,creation_timestamp,modify_timestamp,comment_for_guard)
values
    ('ce170212-7242-4f56-9297-d84b528eaedd','c397aebd-9cfe-47d1-9f1c-75aab323daf5',8,6,NOW(),True,NOW(),NOW(),'Hey there'),
    ('ce170212-7242-4f56-9297-d84b528ea0fd','ce170212-7242-4f56-9298-d84b521eaedd',10,7,NOW(),True,NOW(),NOW(),'Hey Itzik')