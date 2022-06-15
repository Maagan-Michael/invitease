import React from "react";
import { Button } from "@mui/material";



export function DayOfTheWeek(props: any) {

    function setDay(day: number) {
        props.setChosenDay(day)
    }

    return (
        <div className="row">

            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4vw",
                margin: "1vw",
                color: props.chosenDay === 7 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 7 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(7)}>
                'ש
            </Button>

            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",

                color: props.chosenDay === 6 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 6 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(6)}>
                'ו
            </Button>

            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",

                color: props.chosenDay === 5 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 5 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(5)}>
                'ה
            </Button>



            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",

                color: props.chosenDay === 4 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 4 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(4)}>
                'ד
            </Button>


            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",

                color: props.chosenDay === 3 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 3 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(3)}>
                'ג
            </Button>


            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",


                color: props.chosenDay === 2 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 2 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(2)}>
                'ב
            </Button>


            <Button sx={{
                fontSize: "3vw",
                width: "4vw",
                height: "4.5vw",
                margin: "1vw",
                color: props.chosenDay === 1 ? "#3b2d62" : "white",
                borderColor: "white",
                borderRadius: 2,

                backgroundColor: props.chosenDay === 1 ? "white" : "#3b2d62",
            }} variant="outlined" onClick={() => setDay(1)}>
                'א
            </Button>
        </div>
    )
}