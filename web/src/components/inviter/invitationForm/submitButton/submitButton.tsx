import React from "react";
import { Button } from '@mui/material';



export function SubmitButton(props: any) {

    return (
        <div className="row">
            <Button variant="contained" sx={{
                 width: "100px",
                 color: "white",}} >שליחה</Button>

        </div>

    )
}