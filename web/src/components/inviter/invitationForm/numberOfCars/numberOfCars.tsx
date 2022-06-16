import * as React from "react";
import { NumberOfCarsBox } from "./numberOfCarsBox";
import { IconButton } from "@mui/material";
import "./numberOfCars.css"

export function NumberOfCars({ increment, decrement, currentValue }: ISetNumberOfCars) {

  return (
    <div className="row">
      <IconButton sx={{
        fontSize: "4vw",
        width: "5vw",
        height: "5vw",
        color: "white"
      }} onClick={decrement}>
        -
      </IconButton>

      <NumberOfCarsBox currentValue={currentValue} />

      <IconButton sx={{
        fontSize: "4vw",
        width: "5vw",
        height: "5vw",

        color: "white"
      }} onClick={increment}>
        +
      </IconButton>

    </div>
  )
}

interface ISetNumberOfCars {
  increment(): void;
  decrement(): void;
  currentValue: number;
}