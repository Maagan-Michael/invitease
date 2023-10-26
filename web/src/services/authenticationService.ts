import { Log, User, UserManager } from 'oidc-client-ts';
import { AuthenticationSettings } from '../settings/AuthenticationSettings';
import { JsonHelper } from '../utilities/jsonHelper';
import { Roles } from '../utilities/roles';

export class AuthenticationService {
    public userManager: UserManager;

    constructor(settings: AuthenticationSettings) {
        const oidcSettings = {
            authority: settings.serviceUrl,
            client_id: settings.clientId,
            redirect_uri: settings.applicationRoot + `signin-callback`,
            response_type: 'code',
            scope: settings.scope
        };
        this.userManager = new UserManager(oidcSettings);

        Log.setLogger(console);
        Log.setLevel(Log.INFO);
    }

    public getUser(): Promise<User | null> {
        return this.userManager.getUser();
    }

    public login(): Promise<void> {
        return this.userManager.signinRedirect();
    }

    public renewToken(): Promise<User> {
        return this.userManager.signinSilent();
    }

    public logout(): Promise<void> {
        return this.userManager.signoutRedirect({ state: (window.location.pathname + window.location.search).substring(1) });
    }

    public handleSignin(): Promise<User> {
        return this.userManager.signinRedirectCallback();
    }

    public async getUserRoles(): Promise<string[]> {
        var user = await this.getUser();
        const claims = JsonHelper.parseJwt(user.access_token);
        console.log("Claims", claims);
        const allowedRoles = [Roles.admin, Roles.guard, Roles.user]
        const roles = (claims.roles as string[]).filter(r => allowedRoles.includes(r));
        return roles;
    }
}