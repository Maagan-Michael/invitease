import * as React from 'react';
import { GuardInvitationsTable } from '../../components/guard/guardInvitationsTable';
import { IInvitation } from '../../models/invitation';
import { useApplicationContext } from '../../utilities/applicationContext';

export function ActiveInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitation[]);
    const context = useApplicationContext();
    const inviterProxy = context.getInviterProxy();
    React.useEffect(() => {
        inviterProxy.getInvitations()
            .then(r => setInvitations(r));
    }, [inviterProxy]);
    return (
        <GuardInvitationsTable invitations={invitations}/>
    );
}