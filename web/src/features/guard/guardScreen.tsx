import * as React from "react";
import { NavBar } from "../../components/navBar";
import { ActiveInvitations } from "./activeInvitations";
export function GuardScreen(){
    return (
        <div className="basic_div">
            <NavBar />
            <header className="background" >
            </header>
            <ActiveInvitations />
        </div>
    );
}

