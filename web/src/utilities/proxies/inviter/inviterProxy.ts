import { WebProxy } from '../webProxy';
import { UserManager } from "oidc-client-ts";
import { ICreateInvitationRequest } from './createInvitationRequest';
import { IUpdateInvitationRequest } from './updateInvitationRequest';
import { IInvitation } from '../../../models/invitation';
import { JsonHelper } from '../../jsonHelper';

export class InviterProxy extends WebProxy {
    constructor(apiUrl: string, userManager: UserManager) {
        super(apiUrl, userManager);
    }

    public async getInvitations(): Promise<IInvitation[]> {
        const result = await this.getJson("inviter/invitations");
        return JsonHelper.toCamelCase(result) as IInvitation[];
    }

    public createInvitation(request: ICreateInvitationRequest): Promise<void> {
        return this.postAsJson("inviter/invite", request);
    }

    public updateInvitation(invitationId: string, request: IUpdateInvitationRequest): Promise<void> {
        return this.postAsJson("inviter/edit_invitation/" + invitationId, request);
    }
}