import { IInvitation } from './invitation';

export interface IInvitationWithUserName extends IInvitation {
    userName: string;
}