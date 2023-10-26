import * as React from 'react';
import { useEffect } from 'react';
import { useApplicationContext } from '../utilities/applicationContext';

export default function SecureRoute(props: any) {
    const context = useApplicationContext();
    const authService = context.getAuthenticationService();
    useEffect(() => {
        authService.getUser().then(user => {
            if (!user) {
                authService.login();
            } 
        });
    });
    return (<>{props.children}</>);
}