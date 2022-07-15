import * as React from "react";
import Box from '@mui/material/Box';

export function NumberOfCarsBox({ currentValue }: INumberOfCars) {

  return (
    <Box sx={{
      fontSize: "3vw",
      width: "4vw",
      height: "4vw",
      margin: "1vw",
      color: "black",
      textAlign: "center",
      borderRadius: 2,
      backgroundColor: "white",
      '&:hover': {
        backgroundColor: "white",
        opacity: [0.9, 0.8, 0.7],
      },
    }}>{currentValue}</Box>
  )
}

interface INumberOfCars {
  currentValue: number;
}