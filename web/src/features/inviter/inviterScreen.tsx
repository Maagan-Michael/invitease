import React from "react";
import { InviterNavBar } from "../../components/inviter/InviterNavBar";
import { CreateInvitation } from "./createInvitation";
import { InviterInvitations } from "./inviterIntitations";

export function InviterScreen(){
    return (
        <div className="basic_div">
            <InviterNavBar />
            <header className="background" >
                {/* <h2>הזמנות שלי</h2> */}
                <CreateInvitation />
                {/* <InviterInvitations /> */}

            </header>
        </div>
    );
}

