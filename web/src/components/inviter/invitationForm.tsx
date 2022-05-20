import * as React from 'react';
import { Formik, Field, Form } from 'formik';

interface IInvitationValues {
    inviteesAmount: number;
    commentForGuard: string;
}

interface IFormOptions {
    initialValues: IInvitationValues,
    submitting(values: IInvitationValues): Promise<void> | null
}

export function InvitationForm({ initialValues, submitting }: IFormOptions) {
    if (!initialValues) {
        initialValues = {
            inviteesAmount: 1,
            commentForGuard: ''
        }
    }

    const validateAmount = (amount: number) => {
        if (amount <= 0 || Math.round(amount) !== amount) {
            return "Amount must be a positive integer.";
        }
        return undefined;
    };

    return (
        <Formik
            initialValues={{
                inviteesAmount: initialValues.inviteesAmount,
                commentForGuard: initialValues.commentForGuard
            }}
            onSubmit={submitting}
        >
            {({ isSubmitting }) => (
                <Form>
                    <label htmlFor="inviteesAmount">Amount:</label>
                    <Field id="inviteesAmount" name="inviteesAmount" type="number" validate={validateAmount} />
                    <label htmlFor="commentForGuard">Comment for guard:</label>
                    <Field id="commentForGuard" name="commentForGuard" />
                    <button type="submit" disabled={isSubmitting}>Create</button>
                </Form>
            )}
        </Formik>
    );
}
