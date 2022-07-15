import * as React from "react";
import { Button } from '@mui/material';

export function SubmitButton({ submit }: ISubmitButton) {
    return (
        <div className="row">
            <Button onClick={submit} variant="contained" sx={{
                width: "100px",
                color: "white",
            }} >שליחה</Button>
        </div>
    )
}

interface ISubmitButton {
    submit(): void;
}