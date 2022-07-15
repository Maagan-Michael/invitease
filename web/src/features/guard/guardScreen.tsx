import * as React from "react";
import { GuardNavBar } from "../../components/guard/guardNavBar";
import { ActiveInvitations } from "./activeInvitations";
export function GuardScreen(){
    return (
        <div className="basic_div">
            <GuardNavBar />
            <header className="background" >
            </header>
            <ActiveInvitations />
        </div>
    );
}

