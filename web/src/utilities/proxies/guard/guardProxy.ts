import { WebProxy } from '../webProxy';
import { IGetUserNamesRequest } from './getUserNamesRequest';
import { IChangeAdmittedRequest } from './updateInviteesRequest';
import { IUserName } from '../../../models/userName';
import { IInvitation } from '../../../models/invitation';
import { JsonHelper } from '../../jsonHelper';

export class GuardProxy extends WebProxy {

    public async getActiveInvitations(): Promise<IInvitation[]> {
        const result = await this.getJson("guard/invitations");
        return JsonHelper.toCamelCase(result) as IInvitation[];
    }

    public async getUserNames(request: IGetUserNamesRequest): Promise<IUserName[]> {
       const result =  await this.getJson("guard/user_names", JsonHelper.toSnakeCase(request));
       return JsonHelper.toCamelCase(result) as IUserName[];
    }

    public async changeAdmitted(invitationId: string, request: IChangeAdmittedRequest): Promise<void> {
        await this.postAsJson("guard/change_admitted/" + invitationId, JsonHelper.toSnakeCase(request));
    }
}