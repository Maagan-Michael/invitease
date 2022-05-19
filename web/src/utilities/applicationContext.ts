import * as React from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { InviterService } from '../services/inviterService';
import { SettingsService } from '../services/settingsService';

export interface IApplicationContext {
    getAuthenticationService(): AuthenticationService;
    getSettingsService(): SettingsService;
    getInviterService(): InviterService;
}

export const ApplicationContext = React.createContext({} as IApplicationContext);

export function useApplicationContext(): IApplicationContext {
    return React.useContext(ApplicationContext);
}