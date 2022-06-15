import React from "react";
import { NumberOfCarsBox } from "./numberOfCarsBox";
import { IconButton } from "@mui/material";
import "./numberOfCars.css"



export function NumberOfCars(props: any) {

  function add() {

    props.setNumberOfCars((oldNumber: number) => {
      if (oldNumber === 20) {
        return oldNumber;
      } else {
        return oldNumber + 1;
      }
    })
  }

  function subtract() {

    props.setNumberOfCars((oldNumber: number) => {
      if (oldNumber === 0) {
        return oldNumber;
      } else {
        return oldNumber - 1;
      }
    })
  }
  return (
    <div className="row">
      <IconButton sx={{
        fontSize: "4vw",
        width: "5vw",
        height: "5vw",
        
        color: "white"
      }} onClick={subtract}>
        -
      </IconButton>


      <NumberOfCarsBox numberOfCars={props.numberOfCars} />

      <IconButton sx={{
         fontSize: "4vw",
         width: "5vw",
         height: "5vw",
         
        color: "white"
      }} onClick={add}>
        +
      </IconButton>

    </div>
  )
}