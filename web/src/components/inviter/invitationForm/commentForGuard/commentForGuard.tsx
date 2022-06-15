import React from "react";
import { TextField } from "@mui/material";


export function CommentForGuard(props:any){

    return ( 
        <div className="row">

<TextField
          id="filled-multiline-flexible"
          label="הערה לשומר"
          multiline
          maxRows={4}
          value={props.comment}
          onChange={props.handleChange}
          variant="filled"
          sx ={{
              color: "white",
              backgroundColor: "white",
              width: "30vw",
              
          }}
        />
        </div>

    )
}