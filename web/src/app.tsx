import * as React from 'react';
import { Routes, Route, Navigate } from "react-router-dom";
import SecureRoute from './components/secureRoute';
import { SigninCallback } from "./components/signinCallback";
import { UserInvitations } from './components/user/userInvitations';
import { SettingsService } from './services/settingsService';
import { AuthenticationService } from './services/authenticationService';
import { InviterService } from './services/inviterService';
import { ApplicationContext } from './utilities/applicationContext';

function App() {
  const context = new AppContext();
  return (
    <ApplicationContext.Provider value={context}>
      <Routes>
        <Route path='/' element={<Navigate to="/index" />}>
        </Route>
        <Route path="signin-callback" element={<SigninCallback />} />
        <Route path='index' element={<SecureRoute><UserInvitations /></SecureRoute>} />
      </Routes>
    </ApplicationContext.Provider>
  );
}

export default App;

class AppContext {
  private settingsService: SettingsService;
  private authenticationService: AuthenticationService;
  private inviterService: InviterService;

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

  public getInviterService(): InviterService {
    if (!this.inviterService) {
      this.inviterService = new InviterService(this.getSettingsService().getServerUrl(), this.getAuthenticationService().userManager);
    }
    return this.inviterService;
  }
}