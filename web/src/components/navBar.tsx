import * as React from "react";
import "../index.css"
import { Link } from "react-router-dom";
import Logo from "./logo";
import { useApplicationContext } from "../utilities/applicationContext";
import { Roles } from "../utilities/roles";

export function NavBar() {
    const [roles, setRoles] = React.useState([]);
    const authenticationService = useApplicationContext().getAuthenticationService();
    React.useEffect(() => {
        authenticationService.getUserRoles()
            .then(r => setRoles(r));
    }, [authenticationService]);

    return (
        <header className="header">
            <nav className="nav">
                <div className="nav">
                    <Logo />
                </div>
                <ul className="nav_items">
                    <li><Link to="/index">ההזמנות שלי</Link></li>
                    <GaurdInvitationsLink isVisible={roles.includes(Roles.guard)} />
                    <li>היסטוריה</li>
                    <li>צור קשר</li>
                    <li>עלינו</li>
                </ul>
            </nav>
        </header>
    );
}


function GaurdInvitationsLink({ isVisible }: IGaurdInvitationsLinkData) {
    if (isVisible) {
        return (<li><Link to="/guard/invitations">ההזמנות</Link></li>);
    }
    return (<></>);
}

interface IGaurdInvitationsLinkData {
    isVisible: boolean;
}