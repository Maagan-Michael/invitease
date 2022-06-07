import * as React from 'react';
import { IInvitationValues, InvitationForm } from '../../components/inviter/invitationForm/invitationForm';
import { useApplicationContext } from '../../utilities/applicationContext';


export function CreateInvitation() {
    const context = useApplicationContext();
    const inviterProxy = context.getInviterProxy();
    const createInvitation = async (values: IInvitationValues) => {
        const request = {
            inviteesAmount: values.inviteesAmount,
            commentForGuard: values.commentForGuard,
            inviteesArrivalTimestamp: values.inviteesArrivalTimestamp
        };
        await inviterProxy.createInvitation(request);
        
        window.location.href = '/';
    };

    return (
        <InvitationForm submitting={createInvitation} />
    );
}
