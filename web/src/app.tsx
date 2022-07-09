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
import { GuardScreen } from './features/guard/guardScreen';
import { GuardProxy } from './utilities/proxies/guard/guardProxy';


function App() {
  const context = new AppContext();
  return (
    <ApplicationContext.Provider value={context}>
      <Routes>
        <Route path='/' element={<Navigate to="/index" />} />
        <Route path="signin-callback" element={<SigninCallback />} />
        <Route path='index' element={<SecureRoute><GuardScreen /></SecureRoute>} />
      </Routes>
    </ApplicationContext.Provider>
  );
}

export default App;

class AppContext {
  private settingsService: SettingsService | undefined;
  private authenticationService: AuthenticationService | undefined;
  private inviterProxy: InviterProxy | undefined;
  private guardProxy: GuardProxy | undefined;

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

  public getGuardProxy(): GuardProxy {
    if (!this.guardProxy) {
      this.guardProxy = new GuardProxy(this.getSettingsService().getServerUrl(), this.getAuthenticationService());
    }
    return this.guardProxy;
  }
}