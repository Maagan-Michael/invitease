import * as React from 'react';
import { AuthenticationService } from '../services/authenticationService';
import { SettingsService } from '../services/settingsService';

export function SigninCallback() {
    let authSettings = new SettingsService().getAuthenticationSettings();
    let authService = new AuthenticationService(authSettings);
    React.useEffect(() => {
        authService.handleSignin()
            .then(user => (window as any).location.href = authSettings.applicationRoot + "index");
    });
    return (<></>);
}
