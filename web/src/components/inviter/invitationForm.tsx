import * as React from 'react';
import { Formik, Field, Form } from 'formik';

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

    return (
        <Formik
            initialValues={{
                inviteesAmount: initialValues.inviteesAmount,
                commentForGuard: initialValues.commentForGuard,
                inviteesArrivalTimestamp:initialValues.inviteesArrivalTimestamp
            }}
            onSubmit={submitting}
        >
            {({ isSubmitting }) => (
                <Form>
                    <label htmlFor="inviteesAmount">Amount:</label>
                    <Field id="inviteesAmount" name="inviteesAmount" type="number" validate={validateAmount} />
                    <label htmlFor="inviteesArrivalTimestamp">Amount:</label>
                    <Field id="inviteesArrivalTimestamp" name="inviteesArrivalTimestamp" type="date" validate={validateInviteesArrivalTimestamp} />
                    <label htmlFor="commentForGuard">Comment for guard:</label>
                    <Field id="commentForGuard" name="commentForGuard" />
                    <button type="submit" disabled={isSubmitting}>Create</button>
                </Form>
            )}
        </Formik>
    );
}
