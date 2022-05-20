import * as React from 'react';
import { IInvitation } from '../../models/invitation';
import Moment from 'react-moment';

interface IInvitations {
  invitations: IInvitation[];
}

export function InvitationsTable({ invitations }: IInvitations) {
  const renderRows = function () {
    return invitations.map((invitation) => <InvitaionRow invitation={invitation} />)
  }
  return (
    <table>
      <thead>
        <tr>
          <th>
            addmitted
          </th>
          <th>
            invited
          </th>
          <th>
            arriving at
          </th>
          <th>
            comment for guard
          </th>
          <th>
            created at
          </th>
          <th>
            is active
          </th>
        </tr>
      </thead>
      <tbody>
        {renderRows()}
      </tbody>
    </table>
  );
}

function InvitaionRow({ invitation }: IInvitaionRowData) {
  return (
    <tr>
      <td>
        {invitation.inviteesAdmitted}
      </td>
      <td>
        {invitation.inviteesAmount}
      </td>
      <td>
        <Moment format="MM/DD HH:mm" date={invitation.inviteesArrivalTimestamp} />
      </td>
      <td>
        {invitation.commentForGuard}
      </td>
      <td>
        <Moment format="MM/DD HH:mm" date={invitation.creationTimestamp} />
      </td>
      <td>
        {invitation.isActive.toString()}
      </td>
    </tr>
  );
}

interface IInvitaionRowData {
  invitation: IInvitation
}