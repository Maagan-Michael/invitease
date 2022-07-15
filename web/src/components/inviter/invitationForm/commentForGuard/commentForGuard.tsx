import * as React from "react";
import { TextField } from "@mui/material";

export function CommentForGuard({ comment, setComment }: ICommentForGaurd) {

    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setComment(event.target.value);
    };

    return (
        <div className="row">
            <TextField
                id="filled-multiline-flexible"
                label="הערה לשומר"
                multiline
                maxRows={4}
                value={comment}
                onChange={handleChange}
                variant="filled"
                sx={{
                    color: "white",
                    backgroundColor: "white",
                    width: "30vw",

                }}
            />
        </div>
    )
}

interface ICommentForGaurd {
    comment: string;
    setComment(comment: string): void;
}