import * as React from 'react';
import { Routes, Route } from "react-router-dom";
import Example from './components/example';
import SecureRoute from './components/secureRoute';
import { SigninCallback } from "./components/signinCallback";

function App() {

  return (
    <Routes>
      <Route path='/'>
        <Route path="signin-callback" element={<SigninCallback />} />
        <Route path='index' element={<SecureRoute><Example /></SecureRoute>} />
      </Route>
    </Routes>
  );
}

export default App;