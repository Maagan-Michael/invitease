import * as React from 'react';
import { IInvitation } from '../../models/invitation';
import Moment from 'react-moment';
import { useApplicationContext } from '../../utilities/applicationContext';

export function InviterInvitations() {
  const [invitations, setInvitations] = React.useState([] as IInvitation[]);
  const context = useApplicationContext();

  React.useEffect(() => {
    const inviterProxy = context.getInviterProxy();
    inviterProxy.getInvitations()
      .then(r => setInvitations(r));
  }, [invitations]);

  const renderRows = function () {
    return invitations.map((invitation) => <InvitaionRow invitation={invitation} />)
  }
  return (
    <>
      <div>
        <button>Invite</button>
      </div>
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
    </>
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