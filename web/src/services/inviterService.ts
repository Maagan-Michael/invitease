import { WebProxy } from '../utilities/webProxy';
import { UserManager } from "oidc-client-ts";
import { Invitation } from '../models/invitation';
import { JsonHelper } from '../utilities/jsonHelper';

export class InviterService extends WebProxy {
    constructor(apiUrl: string, userManager: UserManager) {
        super(apiUrl, userManager);
    }

    public async getInvitations(): Promise<Invitation[]> {
        const result = await this.getJson("inviter/invitations");
        return JsonHelper.toCamelCase(result) as Invitation[];
    }
}