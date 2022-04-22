import * as React from 'react';
import { Routes, Route , Navigate} from "react-router-dom";
import Example from './components/example';
import SecureRoute from './components/secureRoute';
import { SigninCallback } from "./components/signinCallback";

function App() {

  return (
    <Routes>
      <Route path='/' element={<Navigate to='index' /> }>
      </Route>
        <Route path="signin-callback" element={<SigninCallback />} />
        <Route path='index' element={<SecureRoute><Example /></SecureRoute>} />
    </Routes>
  );
}

export default App;