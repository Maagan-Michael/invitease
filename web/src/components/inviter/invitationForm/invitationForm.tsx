import * as React from 'react';
import './invitationForm.css'
import { NumberOfCars } from './numberOfCars/numberOfCars';
import { DayOfTheWeek } from './dayOfTheWeek/dayOfTheWeek';
import { CommentForGuard } from './commentForGuard/commentForGuard';
import { SubmitButton } from './submitButton/submitButton';

export interface IInvitationValues {
    inviteesAmount: number;
    commentForGuard: string;
    inviteesArrivalTimestamp: Date;
}

interface IFormOptions {
    initialValues?: IInvitationValues,
    submitting(values: IInvitationValues): Promise<void>
}

export function InvitationForm({ initialValues, submitting }: IFormOptions) {
    if (!initialValues) {
        initialValues = {
            inviteesAmount: 1,
            commentForGuard: '',
            inviteesArrivalTimestamp: new Date(new Date().getDate() + 1)
        }
    }

    const [numberOfCars, setNumberOfCars] = React.useState(0);
    const [chosenDay, setChosenDay] = React.useState(0);
    const [comment, setComment] = React.useState("")

    const increment = () => {
        if (numberOfCars < 20) {
            return setNumberOfCars(numberOfCars + 1);
        }
    };

    const decrement = () => {
        if (numberOfCars > 0) {
            return setNumberOfCars(numberOfCars - 1);
        }
    };

    return (
        <div className='center'>
            <h3 className='row'>?כמה רכבים</h3>
            <NumberOfCars currentValue={numberOfCars} increment={increment} decrement={decrement} />
            <h3 className='row'>?באיזה יום</h3>
            <DayOfTheWeek current={chosenDay} setDay={setChosenDay} />
            <h3 className='row'>הערה לשומר</h3>
            <CommentForGuard comment={comment} setComment={setComment} />
            <SubmitButton />
        </div>
    );
}