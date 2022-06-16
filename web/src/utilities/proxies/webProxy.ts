import { AuthenticationService } from "../../services/authenticationService";

export class WebProxy {
    private authenticationService: AuthenticationService
    private apiUrl: string

    constructor(apiUrl: string, authenticationService: AuthenticationService) {
        this.authenticationService = authenticationService;
        this.apiUrl = apiUrl;
    }

    protected async getJson<T>(url: string, headers: Headers = {} as Headers): Promise<T> {
        const user = await this.authenticationService.getUser();
        const requestInit = {
            method: 'GET',
            headers: this.createAuthorizationHeader(headers, user.access_token),
        };
        let result = await fetch(this.apiUrl + url, requestInit)
            .then(async r => {
                await this.redirectIfUnauthorized(r.status);
                const json = await r.json();
                return json as T;
            });
        return result;
    }

    protected async postAsJson<T>(url: string, body: T, headers: Headers = {} as Headers): Promise<Response> {
        const user = await this.authenticationService.getUser();
        const requestInit = {
            method: 'POST',
            headers: this.createAuthorizationHeader(headers, user.access_token),
            body: JSON.stringify(body),
        };
        requestInit.headers.set("Content-Type", "application/json");
        let response = await fetch(this.apiUrl + url, requestInit);
        await this.redirectIfUnauthorized(response.status);
        return response;
    }

    private createAuthorizationHeader(headers: Headers, accessToken: string): Headers {
        let result = new Headers(headers);

        result.set("Authorization", "Bearer " + accessToken);

        return result;
    }

    private async redirectIfUnauthorized(status: number): Promise<void> {
        if (status === 401) {
            await this.authenticationService.logout();
            await this.authenticationService.login();
        }
    }
}