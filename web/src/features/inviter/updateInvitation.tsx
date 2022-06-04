import * as React from 'react';
import { IInvitationValues, InvitationForm } from '../../components/inviter/invitationForm/invitationForm';
import { useApplicationContext } from '../../utilities/applicationContext';
import { IUpdateInvitationRequest } from '../../utilities/proxies/inviter/updateInvitationRequest';

const context = useApplicationContext();
const inviterProxy = context.getInviterProxy();

export interface IUpdateInvitationOptions extends IUpdateInvitationRequest {
    invitationId: string;
}

export function UpdateInvitation(options: IUpdateInvitationOptions) {
    const updateInvitation = async (values: IInvitationValues) => {
        const request = {
            inviteesAmount: values.inviteesAmount,
            commentForGuard: values.commentForGuard,
            inviteesArrivalTimestamp: values.inviteesArrivalTimestamp,
            isActive: options.isActive
        };
        await inviterProxy.updateInvitation(options.invitationId, request);
        window.location.href = '/';
    };

    return (
        <InvitationForm submitting={updateInvitation} />
    );
}
