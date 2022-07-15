import * as React from 'react';
import { GuardInvitationsTable } from '../../components/guard/guardInvitationsTable';
import { IInvitation } from '../../models/invitation';
import { IInvitationWithUserName } from '../../models/invitationWithUserName';
import { useApplicationContext } from '../../utilities/applicationContext';

export function ActiveInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitationWithUserName[]);
    const context = useApplicationContext();
    const guardStore = context.getGuardStore();
    React.useEffect(() => {
        guardStore.getActiveInvitations()
            .then(r => setInvitations(r));
    }, [guardStore]);

    const changeAdmitted = async (invitation: IInvitation, change: number) => {
        var admitted = invitation.inviteesAmount;
        admitted = Math.min(Math.max(admitted + change, 0), invitation.inviteesAmount);
        if (admitted !== invitation.inviteesAdmitted) {
            invitation.inviteesAdmitted = admitted;
            await guardStore.changeAdmitted(invitation.invitationId, { inviteesAdmitted: invitation.inviteesAdmitted });
        }
        return admitted;
    };

    return (
        <GuardInvitationsTable invitations={invitations} changeAdmitted={changeAdmitted} />
    );
}