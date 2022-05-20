import { UserManager } from "oidc-client-ts";

export class WebProxy {
    private userManager: UserManager
    private apiUrl: string

    constructor(apiUrl: string, userManager: UserManager) {
        this.userManager = userManager;
        this.apiUrl = apiUrl;
    }

    protected async getJson(url: string, headers: Headers = {} as Headers): Promise<any> {
        const user = await this.userManager.getUser();
        const requestInit = {
            method: 'GET',
            headers: this.createAuthorizationHeader(headers, user.access_token),
        };
        let result = await fetch(this.apiUrl + url, requestInit)
            .then(r => r.json());
        return result;
    }

    protected async postAsJson(url: string, body: any, headers: Headers = {} as Headers): Promise<any> {
        const user = await this.userManager.getUser();
        const requestInit = {
            method: 'POST',
            headers: this.createAuthorizationHeader(headers, user.access_token),
            body: body,
        };
        requestInit.headers.set("Content-Type", "application/json");
        let result = await fetch(this.apiUrl + url, requestInit);
        return result;
    }

    private createAuthorizationHeader(headers: Headers, accessToken: string): Headers {
        let result = new Headers(headers);

        result.set("Authorization", "Bearer " + accessToken);

        return result;
    }
}