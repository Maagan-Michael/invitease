import * as React from "react";
import { NavBar } from "../../components/navBar";
import { CreateInvitation } from "./createInvitation";
import { InviterInvitations } from "./inviterIntitations";

export function InviterScreen(){
    return (
        <div className="basic_div">
            <NavBar />
            <header className="background" >
                <CreateInvitation />
                <InviterInvitations />
            </header>
        </div>
    );
}

