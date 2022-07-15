import * as React from 'react';
import { GuardInvitationsTable } from '../../components/guard/guardInvitationsTable';
import { IInvitation } from '../../models/invitation';
import { IInvitationWithUserName } from '../../models/invitationWithUserName';
import { useApplicationContext } from '../../utilities/applicationContext';
import { IUserName } from '../../models/userName';

export function ActiveInvitations() {
    const [invitations, setInvitations] = React.useState([] as IInvitationWithUserName[]);
    const context = useApplicationContext();
    const guardProxy = context.getGuardProxy();
    React.useEffect(() => {
        guardProxy.getActiveInvitations()
            .then(async r => {
                const userIds = new Set<string>(r.map(a => a.userId));
                const userNames = await guardProxy.getUserNames({ usersIdList: userIds });
                setInvitations(r.map(i => convertToInvitationWithUserName(i, userNames)));
            });
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

function convertToInvitationWithUserName(invitation: IInvitation, userNames: IUserName[]): IInvitationWithUserName {
    var userName = userNames.find(e => e.userId === invitation.invitationId);
    if (userName) {
        return { ...invitation, userName: userName.lastName + ", " + userName.firstName };
    }
    return { ...invitation, userName: "N/A" };
}