export interface IInvitation{
    invitationId: string;
    userId: string;
    inviteesAmount: number;
    inviteesAdmitted: number;
    inviteesArrivalTimestamp: Date;
    isActive: boolean;
    creationTimestamp: Date;
    modifyTimestamp: Date;
    commentForGuard: string;
}