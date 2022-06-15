import * as React from 'react';
import { Formik, Field, Form } from 'formik';
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

    const validateAmount = (amount: number) => {
        if (amount <= 0 || Math.round(amount) !== amount) {
            return "Amount must be a positive integer.";
        }
        return undefined;
    };

    const validateInviteesArrivalTimestamp = (timestamp: Date) => {
        if (timestamp <= new Date()) {
            return "Timestamp must be in the future.";
        }
        return undefined;
    };

    const [numberOfCars, setNumberOfCars ]=  React.useState(0);
    const [chosenDay, setChosenDay ]=  React.useState(0);
    const [comment, setComment] = React.useState("")

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setComment(event.target.value);
  };



   


    return (<div className='center'>
        <h3 className='row'>?כמה רכבים</h3>
        <NumberOfCars numberOfCars = {numberOfCars} setNumberOfCars = {setNumberOfCars} />
        <h3 className='row'>?באיזה יום</h3>
        <DayOfTheWeek chosenDay={chosenDay} setChosenDay={setChosenDay}/>
        <h3 className='row'>הערה לשומר</h3>
        <CommentForGuard comment= {comment} handleChange={handleChange}/>
        <h1></h1>
        <SubmitButton />
    
       
        </div>
        );
    }

    // <Formik
    //     initialValues={{
    //         inviteesAmount: initialValues.inviteesAmount,
    //         commentForGuard: initialValues.commentForGuard,
    //         inviteesArrivalTimestamp:initialValues.inviteesArrivalTimestamp
    //     }}
    //     onSubmit={submitting}
    // >
    //     {({ isSubmitting }) => (
    //         <div className='center'>
    //         <Form className='form-box'>
    //             <label htmlFor="inviteesAmount">:כמות רכבים</label>
    //             <Field id="inviteesAmount" name="inviteesAmount" type="number" validate={validateAmount} />
    //             <label htmlFor="inviteesArrivalTimestamp">:זמן הגעה משוער</label>
    //             <Field id="inviteesArrivalTimestamp" name="inviteesArrivalTimestamp" type="date" validate={validateInviteesArrivalTimestamp} />
    //             <label htmlFor="commentForGuard">:הערה לשומר</label>
    //             <Field id="commentForGuard" name="commentForGuard" />
    //             <button type="submit" className='submitButton' disabled={isSubmitting}>שליחה</button>
    //         </Form>

    //         </div>
    //     )}
    // </Formik>