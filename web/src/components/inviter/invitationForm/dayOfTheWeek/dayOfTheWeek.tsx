import React from "react";
import { Button } from "@mui/material";

export function DayOfTheWeek({ current, setDay }: IDayOfTheWeek) {
    return (
        <div className="row">
            <DayButton setDay={setDay} value={7} display={"'ש"} current={current} />
            <DayButton setDay={setDay} value={6} display={"'ו"} current={current} />
            <DayButton setDay={setDay} value={5} display={"'ה"} current={current} />
            <DayButton setDay={setDay} value={4} display={"'ד"} current={current} />
            <DayButton setDay={setDay} value={3} display={"'ג"} current={current} />
            <DayButton setDay={setDay} value={2} display={"'ב"} current={current} />
            <DayButton setDay={setDay} value={1} display={"'א"} current={current} />
        </div>
    )
}

function DayButton({ value, current, display, setDay }: IDayButton) {
    return (
        <Button sx={{
            fontSize: "3vw",
            width: "4vw",
            height: "4.5vw",
            margin: "1vw",
            color: current === value ? "#3b2d62" : "white",
            borderColor: "white",
            borderRadius: 2,
            backgroundColor: current === value ? "white" : "#3b2d62",
        }} variant="outlined" onClick={() => setDay(value)}>
            {display}
        </Button>
    )
}

interface IDayOfTheWeek {
    current: number;
    setDay(day: number): void;
}

interface IDayButton {
    value: number;
    current: number;
    display: string;
    setDay(day: number): void;
}