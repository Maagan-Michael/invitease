import * as React from 'react';
import './invitationForm.css'
import { NumberOfCars } from './numberOfCars/numberOfCars';
import { DayOfTheWeek } from './dayOfTheWeek/dayOfTheWeek';
import { CommentForGuard } from './commentForGuard/commentForGuard';
import { useApplicationContext } from '../../../utilities/applicationContext';
import moment from 'moment';
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

    const context = useApplicationContext();
    const [numberOfCars, setNumberOfCars] = React.useState(initialValues.inviteesAmount);
    const [chosenDay, setChosenDay] = React.useState(moment(initialValues.inviteesArrivalTimestamp).weekday() + 1);
    const [comment, setComment] = React.useState("")

    const inviterProxy = context.getInviterProxy();
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

    const submit = () => {
        const data = {
            inviteesArrivalTimestamp: moment(new Date()).startOf("week").add(chosenDay - 1, "days").toDate(),
            inviteesAmount: numberOfCars,
            commentForGuard: comment
        };
        inviterProxy.createInvitation(data).then(() => window.location.href = "/");
    };

    return (
        <div className='center'>
            <h3 className='row'>?כמה רכבים</h3>
            <NumberOfCars currentValue={numberOfCars} increment={increment} decrement={decrement} />
            <h3 className='row'>?באיזה יום</h3>
            <DayOfTheWeek current={chosenDay} setDay={setChosenDay} />
            <h3 className='row'>הערה לשומר</h3>
            <CommentForGuard comment={comment} setComment={setComment} />
            <SubmitButton submit={submit} />
        </div>
    );
}