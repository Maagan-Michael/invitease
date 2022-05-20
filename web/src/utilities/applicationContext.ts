import * as React from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { InviterProxy } from '../utilities/proxies/inviter/inviterProxy';
import { SettingsService } from '../services/settingsService';

export interface IApplicationContext {
    getAuthenticationService(): AuthenticationService;
    getSettingsService(): SettingsService;
    getInviterProxy(): InviterProxy;
}

export const ApplicationContext = React.createContext({} as IApplicationContext);

export function useApplicationContext(): IApplicationContext {
    return React.useContext(ApplicationContext);
}