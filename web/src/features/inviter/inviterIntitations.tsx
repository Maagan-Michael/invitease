import * as React from 'react';
import { InvitationsTable } from '../../components/inviter/invitationsTable';
import { IInvitation } from '../../models/invitation';
import { useApplicationContext } from '../../utilities/applicationContext';

export function InviterInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitation[]);
    const context = useApplicationContext();

    React.useEffect(() => {
        const inviterProxy = context.getInviterProxy();
        inviterProxy.getInvitations()
            .then(r => setInvitations(r));
    }, [invitations]);

    return (
        <>
            <button>Create</button>
            <InvitationsTable invitations={invitations} />
        </>
    );
}