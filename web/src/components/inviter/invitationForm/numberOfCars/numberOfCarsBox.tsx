import React from "react";
import Box from '@mui/material/Box';



export function NumberOfCarsBox(props:any){

   return (
       
           <Box  sx={{
            fontSize: "3vw",
            width: "4vw",
            height: "4vw",
            margin: "1vw",
        color: "black",
        textAlign:"center",
borderRadius:2,
        backgroundColor: "white",
        '&:hover': {
          backgroundColor: "white",
          opacity: [0.9, 0.8, 0.7],
        },
      }}>{props.numberOfCars}</Box>
    
   )
}