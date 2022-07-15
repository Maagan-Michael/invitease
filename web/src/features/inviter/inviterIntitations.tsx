import * as React from 'react';
import { BasicTable } from '../../components/inviter/invitationsTable';
import { IInvitation } from '../../models/invitation';
import { useApplicationContext } from '../../utilities/applicationContext';

export function InviterInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitation[]);
    const context = useApplicationContext();
    const inviterProxy = context.getInviterProxy();
    React.useEffect(() => {
        inviterProxy.getInvitations()
            .then(r => setInvitations(r));
    }, [inviterProxy]);
    return (
        <BasicTable invitations={invitations} />
    );
}