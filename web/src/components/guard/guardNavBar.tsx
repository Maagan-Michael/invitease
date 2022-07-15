import * as React from "react";
import "../../index.css"
import Logo from "../logo";

export function GuardNavBar() {
    return (
        <header className="header">
            <nav className="nav">
                <div className="nav">
                  <Logo />
                </div>
                <ul className="nav_items">
                    <li>היסטוריה</li>
                    <li>צור קשר</li>
                    <li>עלינו</li>
                </ul>
            </nav>
        </header>
    );
}