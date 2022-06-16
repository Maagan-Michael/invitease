import { AuthenticationService } from "../../services/authenticationService";

export class WebProxy {
    private authenticationService: AuthenticationService
    private apiUrl: string

    constructor(apiUrl: string, authenticationService: AuthenticationService) {
        this.authenticationService = authenticationService;
        this.apiUrl = apiUrl;
    }

    protected async getJson<T>(url: string, headers: Headers = {} as Headers): Promise<T | void> {
        const user = await this.authenticationService.getUser();
        const requestInit = {
            method: 'GET',
            headers: this.createAuthorizationHeader(headers, user.access_token),
        };
        const result = await this.fetch(this.apiUrl + url, requestInit)
            .then(r => {
                if (r) {
                    return r.json();
                }
            });
        return result as T;
    }

    protected async postAsJson<T>(url: string, body: T, headers: Headers = {} as Headers): Promise<Response> {
        const user = await this.authenticationService.getUser();
        const requestInit = {
            method: 'POST',
            headers: this.createAuthorizationHeader(headers, user.access_token),
            body: JSON.stringify(body),
        };
        requestInit.headers.set("Content-Type", "application/json");
        const response = await this.fetch(this.apiUrl + url, requestInit);
        if (response) {
            return response;
        }
        return undefined;
    }

    private createAuthorizationHeader(headers: Headers, accessToken: string): Headers {
        let result = new Headers(headers);

        result.set("Authorization", "Bearer " + accessToken);

        return result;
    }

    private async redirectIfUnauthorized(status: number): Promise<void> {
        if (status === 401) {
            await this.authenticationService.logout();
        }
    }

    private async fetch(url: string, requestInit: RequestInit): Promise<Response | void> {
        const response = await fetch(url, requestInit)
            .then(async r => {
                await this.redirectIfUnauthorized(r.status);
                return r;
            })
            .catch(e => this.authenticationService.logout());

        return response;
    }
}