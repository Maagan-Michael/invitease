import * as React from 'react';
import { IInvitationValues, InvitationForm } from '../../components/inviter/invitationForm';
import { useApplicationContext } from '../../utilities/applicationContext';

const context = useApplicationContext();
const inviterProxy = context.getInviterProxy();

export function CreateInvitation() {
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