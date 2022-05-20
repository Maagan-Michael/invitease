import * as React from 'react';
import { useApplicationContext } from '../../utilities/applicationContext';
import { Formik, Field, Form } from 'formik';

interface IValues {
    inviteesAmount: number;
    commentForGuard: string;
}

export function CreateInvitation() {
    const context = useApplicationContext();
    const inviterProxy = context.getInviterProxy();

    const createInvitation = async (values: IValues) => {
        const request = {
            inviteesAmount: values.inviteesAmount,
            commentForGuard: values.commentForGuard,
            isActive: true
        };
        await inviterProxy.createInvitation(request);
        window.location.href = '/';
    };
    const validateAmount = (amount: number) => {
        if (amount <= 0 || Math.round(amount) !== amount) {
            return "Amount must be a positive integer.";
        }
        return undefined;
    };

    return (
        <Formik
            initialValues={{
                inviteesAmount: 1,
                commentForGuard: ''
            }}
            onSubmit={createInvitation}
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
