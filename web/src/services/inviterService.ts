import { WebProxy } from '../utilities/webProxy';
import { UserManager } from "oidc-client-ts";
import { Invitation } from '../models/invitation';

export class InviterService extends WebProxy {
    constructor(apiUrl: string, userManager: UserManager) {
        super(apiUrl, userManager);
    }

    public getInvitations(): Promise<Invitation[]> {
        return this.getJson("inviter/invitations")
            .then(r => r as Invitation[]);
    }
}