import * as React from 'react';
import { GuardInvitationsTable } from '../../components/guard/guardInvitationsTable';
import { IInvitation } from '../../models/invitation';
import { useApplicationContext } from '../../utilities/applicationContext';

export function ActiveInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitation[]);
    const context = useApplicationContext();
    const guardProxy = context.getGuardProxy();
    React.useEffect(() => {
        guardProxy.getActiveInvitations()
            .then(r => setInvitations(r));
    }, [guardProxy]);

    const changeAdmitted = async (invitation: IInvitation, change: number) => {
        var admitted = invitation.inviteesAmount;
        admitted = Math.min(Math.max(admitted + change, 0), invitation.inviteesAmount);
        if (admitted !== invitation.inviteesAdmitted) {
            invitation.inviteesAdmitted = admitted;
            await guardProxy.changeAdmitted(invitation.invitationId, { inviteesAdmitted: invitation.inviteesAdmitted });
        }
        return admitted;
    };

    return (
        <GuardInvitationsTable invitations={invitations} changeAdmitted={changeAdmitted} />
    );
}