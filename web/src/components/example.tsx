import * as React from 'react';
import { useState } from 'react';
import { User } from 'oidc-client-ts';
import { AuthenticationService } from '../services/authenticationService';
import { SettingsService } from '../services/settingsService';

export default function Example() {
    let authSettings = new SettingsService().getAuthenticationSettings();
    let authService = new AuthenticationService(authSettings);
    const [user, setUser] = useState<User | undefined>();
    React.useEffect(() => {
        if (!user) {
            authService.getUser()
                .then(user => setUser(user));
        }
    }, [user]);
    return (<pre>
        {JSON.stringify(user, null, 2)}
    </pre>);
}