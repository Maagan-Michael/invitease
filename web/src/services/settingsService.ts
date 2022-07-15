import { AuthenticationSettings } from '../settings/AuthenticationSettings';

export class SettingsService {
    public getAuthenticationSettings(): AuthenticationSettings {
        let settings = new AuthenticationSettings();

        settings.clientId = (window as any).config.authentication.clientId;
        settings.serviceUrl = (window as any).config.authentication.serviceUrl;
        settings.scope = (window as any).config.authentication.clientScope;
        settings.applicationRoot = (window as any).config.applicationRoot;

        return settings;
    }

    public getServerUrl(): string {
        return (window as any).config.serverUrl;
    }
}