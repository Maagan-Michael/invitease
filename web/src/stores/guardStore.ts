import { GuardProxy } from "../utilities/proxies/guard/guardProxy";
import { IInvitationWithUserName } from "../models/invitationWithUserName";
import { IUserName } from "../models/userName";
import { IChangeAdmittedRequest } from "../utilities/proxies/guard/updateInviteesRequest";
import { IInvitation } from "../models/invitation";

export interface IGuardStore {
    getActiveInvitations(): Promise<IInvitationWithUserName[]>;

    changeAdmitted(invitationId: string, request: IChangeAdmittedRequest): Promise<void>;
}

export class GuardStore implements IGuardStore {
    private proxy: GuardProxy;

    constructor(proxy: GuardProxy) {
        this.proxy = proxy;
    }

    async getActiveInvitations(): Promise<IInvitationWithUserName[]> {
        var invitations = await this.proxy.getActiveInvitations();
        const userIds = new Set<string>(invitations.map(i => i.userId));
        const userNames = await this.proxy.getUserNames({ usersIdList: userIds });
        return invitations.map(i => this.convertToInvitationWithUserName(i, userNames));
    }

    changeAdmitted(invitationId: string, request: IChangeAdmittedRequest): Promise<void> {
        return this.proxy.changeAdmitted(invitationId, request);
    }

    private convertToInvitationWithUserName(invitation: IInvitation, userNames: IUserName[]): IInvitationWithUserName {
        var userName = userNames.find(e => e.userId === invitation.invitationId);
        if (userName) {
            return { ...invitation, userName: userName.lastName + ", " + userName.firstName };
        }
        return { ...invitation, userName: "N/A" };
    }
}
