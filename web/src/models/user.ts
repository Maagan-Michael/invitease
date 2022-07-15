export interface IUser {
    userId: string;
    firstName: string;
    lastName: string;
    cellularNumber: string;
    email: string;
    userRole: string;
    creationTimestamp: Date;
    modifyTimestamp: Date;
    isActive: boolean;
}