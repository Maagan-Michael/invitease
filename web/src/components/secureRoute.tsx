import * as React from 'react';
import { useEffect } from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { SettingsService } from '../services/settingsService';

export default function SecureRoute(props: any) {
    let authSettings = new SettingsService().getAuthenticationSettings();
    let authService = new AuthenticationService(authSettings);
    useEffect(() => {
        authService.getUser().then(user => {
            if (!user) {
                authService.login();
            } 
        });
    });
    return (<>{props.children}</>);
}