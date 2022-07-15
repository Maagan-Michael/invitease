import * as React from "react";
import "../../index.css"
import { Link } from "react-router-dom";
import Logo from "../logo";

export function InviterNavBar() {
    return (
        <header className="header">
            <nav className="nav">
                <div className="nav">
                    <Logo />
                </div>
                <ul className="nav_items">
                    <li><Link to="/index">ההזמנות שלי</Link></li>
                    <li>צור קשר</li>
                    <li>עלינו</li>
                </ul>
            </nav>
        </header>
    );
}