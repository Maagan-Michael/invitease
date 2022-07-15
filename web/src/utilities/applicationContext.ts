import * as React from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { InviterProxy } from '../utilities/proxies/inviter/inviterProxy';
import { SettingsService } from '../services/settingsService';
import { IGuardStore } from '../stores/guardStore';

export interface IApplicationContext {
    getAuthenticationService(): AuthenticationService;
    getSettingsService(): SettingsService;
    getInviterProxy(): InviterProxy;
    getGuardStore(): IGuardStore;
}

export const ApplicationContext = React.createContext({} as IApplicationContext);

export function useApplicationContext(): IApplicationContext {
    return React.useContext(ApplicationContext);
}