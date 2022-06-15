import React from "react";
import "../../index.css"
import logo from "../../images/mm-logo.png"

export function InviterNavBar() {
    return (
        <header className="header">

            <nav className="nav">
                <div className="nav">
                    <img src={logo} className="App-logo-small" alt="logo" />
                    <h1 className="nav_title">Invitease</h1>
                </div>
                <ul className="nav_items">
                    <li>הזמנות שלי</li>
                    <li>צור קשר</li>
                    <li>עלינו</li>
                </ul>
            </nav>
        </header>
    );
}