import * as React from 'react';
import { InvitationsTable } from '../../components/inviter/invitationsTable';
import { BasicTable } from '../../components/inviter/invitationsTable';
import { IInvitation } from '../../models/invitation';
import { useApplicationContext } from '../../utilities/applicationContext';

export function InviterInvitations() {
    const u:IInvitation ={
        invitationId: "1",
        userId: "u1",
        inviteesAmount:4,
        inviteesAdmitted: 3,
        inviteesArrivalTimestamp: new Date(),
        isActive: true,
        creationTimestamp:  new Date(),
        modifyTimestamp:  new Date(),
        commentForGuard: "string",
    };
    const u2:IInvitation ={
        invitationId: "2",
        userId: "u1",
        inviteesAmount:2,
        inviteesAdmitted: 2,
        inviteesArrivalTimestamp: new Date(),
        isActive: false,
        creationTimestamp:  new Date(),
        modifyTimestamp:  new Date(),
        commentForGuard: "רכבים צהובים",
    };

    const u3:IInvitation ={
        invitationId: "3",
        userId: "u1",
        inviteesAmount:2,
        inviteesAdmitted: 4,
        inviteesArrivalTimestamp: new Date(),
        isActive: false,
        creationTimestamp:  new Date(),
        modifyTimestamp:  new Date(),
        commentForGuard: "",
    };

    const u4:IInvitation ={
        invitationId: "4",
        userId: "u1",
        inviteesAmount:5,
        inviteesAdmitted: 5,
        inviteesArrivalTimestamp: new Date(),
        isActive: false,
        creationTimestamp:  new Date(),
        modifyTimestamp:  new Date(),
        commentForGuard: "צבי כפרה עליך",
    };
    const [invitations, setInvitations] = React.useState([u, u2,u3,u4] as IInvitation[]);
    const context = useApplicationContext();

    React.useEffect(() => {
        const inviterProxy = context.getInviterProxy();
        inviterProxy.getInvitations()
            .then(r => setInvitations(r));
    }, []);

    return (
            <BasicTable invitations={invitations} />
    );
}