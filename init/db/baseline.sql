CREATE DATABASE keycloak;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";  

CREATE TYPE event_type AS ENUM ('entered', 'cancelled', 'created', 'modified','guard_in', 'guard_out');

CREATE DOMAIN cellno AS VARCHAR(20) CHECK (VALUE ~* '^0[0-9]{9}$');

create table invitations(
	invitation_id UUID NOT NULL DEFAULT uuid_generate_v4(),
	user_id UUID NOT NULL,
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
	user_id UUID NULL,
	guard_id UUID NULL,
	invitation_id UUID NULL REFERENCES invitations (invitation_id),
	PRIMARY KEY(event_id)
);

/* Mock data */
INSERT INTO event_log(event_timestamp,guard_id,event_type,amount_before,amount_after)
VALUES
	(NOW(),'ce170212-7242-4f56-9298-d84b521eaedd','entered',4,5),
	(NOW(),'c397aebd-9cfe-47d1-9f1c-75aab323daf5','cancelled',3,4);

INSERT INTO invitations(invitation_id,user_id,invitees_amount,invitees_admitted,invitees_arrival_timestamp,is_active,creation_timestamp,modify_timestamp,comment_for_guard)
values
    ('ce170212-7242-4f56-9297-d84b528eaedd','c397aebd-9cfe-47d1-9f1c-75aab323daf5',8,6,NOW(),True,NOW(),NOW(),'Hey there'),
    ('ce170212-7242-4f56-9297-d84b528ea0fd','ce170212-7242-4f56-9298-d84b521eaedd',10,7,NOW(),True,NOW(),NOW(),'Hey Itzik')