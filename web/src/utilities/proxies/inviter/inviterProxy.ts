import { WebProxy } from '../webProxy';
import { ICreateInvitationRequest } from './createInvitationRequest';
import { IUpdateInvitationRequest } from './updateInvitationRequest';
import { IInvitation } from '../../../models/invitation';
import { JsonHelper } from '../../jsonHelper';

export class InviterProxy extends WebProxy {
    public async getInvitations(): Promise<IInvitation[]> {
        const result = await this.getJson("inviter/invitations");
        return JsonHelper.toCamelCase(result) as IInvitation[];
    }

    public async createInvitation(request: ICreateInvitationRequest): Promise<void> {
        await this.postAsJson("inviter/invite", JsonHelper.toSnakeCase(request));
        alert(`הזמנה נוצרה ל-${request.inviteesAmount} רכבים`)
    }

    public async updateInvitation(invitationId: string, request: IUpdateInvitationRequest): Promise<void> {
        await this.postAsJson("inviter/edit_invitation/" + invitationId, JsonHelper.toSnakeCase(request));
    }
}