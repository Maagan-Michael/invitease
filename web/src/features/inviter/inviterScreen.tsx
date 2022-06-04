import React from "react";
import { InviterNavBar } from "../../components/inviter/InviterNavBar";
import { CreateInvitation } from "./createInvitation";
import { InviterInvitations } from "./inviterIntitations";

export function InviterScreen(){
    return (
        <div>
            <InviterNavBar />
            <header className="background" >
                <h2>?אהלן! את מי תרצו להזמין</h2>
                <CreateInvitation />
                {/* <InviterInvitations /> */}

            </header>
        </div>
    );
}

