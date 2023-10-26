import * as React from 'react';
import { IInvitationWithUserName } from '../../models/invitationWithUserName';
import { IInvitation } from '../../models/invitation';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

interface IInvitations {
  invitations: IInvitationWithUserName[];
  changeAdmitted(invitation: IInvitation, change: number): Promise<number>;
}

interface IInvitaionRowData {
  invitation: IInvitationWithUserName;
  changeAdmitted(invitation: IInvitation, change: number): Promise<number>;
}

export function GuardInvitationsTable({ invitations, changeAdmitted }: IInvitations) {
  var rows = invitations.map(x => { return { invitation: x, changeAdmitted: changeAdmitted }; });
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>שם</TableCell>
            <TableCell>נכנסו</TableCell>
            <TableCell>מוזמנים</TableCell>
            <TableCell>הכנסה</TableCell>
            <TableCell>הודעה</TableCell>
            <TableCell align="right">מחיקת הכנסה</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map(renderInvitation)}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

function renderInvitation({ invitation, changeAdmitted }: IInvitaionRowData) {
  return (<GuardInvitationsTableRow invitation={invitation} changeAdmitted={changeAdmitted} />);
}

function GuardInvitationsTableRow({ invitation, changeAdmitted }: IInvitaionRowData) {
  const [admitted, setAdmitted] = React.useState(invitation.inviteesAdmitted);
  const decrease = () => {
    changeAdmitted(invitation, -1)
      .then(result => setAdmitted(result));
  }
  const increase = () => {
    changeAdmitted(invitation, 1)
      .then(result => setAdmitted(result));
  }
  return (
    <TableRow
      key={invitation.invitationId}
      sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
    >
      <TableCell>{invitation.userName}</TableCell>
      <TableCell>{admitted}</TableCell>
      <TableCell>{invitation.inviteesAmount}</TableCell>
      <TableCell onClick={increase}>+</TableCell>
      <TableCell>{invitation.commentForGuard}</TableCell>
      <TableCell align="right" onClick={decrease}>-</TableCell>
    </TableRow>
  );
}
