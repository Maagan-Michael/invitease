import * as React from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { InviterProxy } from '../utilities/proxies/inviter/inviterProxy';
import { GuardProxy } from '../utilities/proxies/guard/guardProxy';
import { SettingsService } from '../services/settingsService';

export interface IApplicationContext {
    getAuthenticationService(): AuthenticationService;
    getSettingsService(): SettingsService;
    getInviterProxy(): InviterProxy;
    getGuardProxy(): GuardProxy;
}

export const ApplicationContext = React.createContext({} as IApplicationContext);

export function useApplicationContext(): IApplicationContext {
    return React.useContext(ApplicationContext);
}