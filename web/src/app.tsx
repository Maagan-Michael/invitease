import * as React from 'react';
import { Routes, Route, Navigate } from "react-router-dom";
import SecureRoute from './components/secureRoute';
import { SigninCallback } from "./components/signinCallback";
import {UserInvitations} from  './components/user/userInvitations';

function App() {

  return (
    <Routes>
      <Route path='/' element={<UserInvitations/>}>
      </Route>
      <Route path="signin-callback" element={<SigninCallback />} />
      {/* <Route path='index' element={<SecureRoute><Example /></SecureRoute>} /> */}
    </Routes>
  );
}

export default App;