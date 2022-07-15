import logo from "../images/mm-logo.png";
import * as React from "react";

export default function Logo() {
    return (
        <>
            <img src={logo} className="App-logo-small" alt="logo" />
            <h1 className="nav_title">Invitease</h1>
        </>
    );
}