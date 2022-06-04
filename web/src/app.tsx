import * as React from 'react';
import { Routes, Route, Navigate } from "react-router-dom";
import SecureRoute from './components/secureRoute';
import { SigninCallback } from "./components/signinCallback";
import { SettingsService } from './services/settingsService';
import { AuthenticationService } from './services/authenticationService';
import { InviterProxy } from './utilities/proxies/inviter/inviterProxy';
import { ApplicationContext } from './utilities/applicationContext';
import { InviterInvitations } from './features/inviter/inviterIntitations';
import { InviterScreen } from './features/inviter/inviterScreen';

function App() {
  const context = new AppContext();
  return (
    <ApplicationContext.Provider value={context}>
      <Routes>
        <Route path='/' element={<Navigate to="/index" />} />
        <Route path="signin-callback" element={<SigninCallback />} />
        <Route path='index' element={<SecureRoute><InviterScreen /></SecureRoute>} />
      </Routes>
    </ApplicationContext.Provider>
  );
}

export default App;

class AppContext {
  private settingsService: SettingsService | undefined;
  private authenticationService: AuthenticationService | undefined;
  private inviterProxy: InviterProxy | undefined;

  public getAuthenticationService(): AuthenticationService {
    if (!this.authenticationService) {
      this.authenticationService = new AuthenticationService(this.getSettingsService().getAuthenticationSettings());
    }
    return this.authenticationService;
  }

  public getSettingsService(): SettingsService {
    if (!this.settingsService) {
      this.settingsService = new SettingsService();
    }
    return this.settingsService;
  }

  public getInviterProxy(): InviterProxy {
    if (!this.inviterProxy) {
      this.inviterProxy = new InviterProxy(this.getSettingsService().getServerUrl(), this.getAuthenticationService());
    }
    return this.inviterProxy;
  }
}