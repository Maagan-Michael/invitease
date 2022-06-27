import * as React from 'react';
import { IInvitation } from '../../models/invitation';
import Moment from 'react-moment';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

interface IInvitations {
  invitations: IInvitation[];
}


export function BasicTable({ invitations }: IInvitations) {
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>תאריך הגעה</TableCell>
            <TableCell align="right">נכנסו</TableCell>
            <TableCell align="right">מוזמנים</TableCell>
            <TableCell align="right">פעיל</TableCell>
            <TableCell align="right">הודעה לשומר</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {invitations.map(renderInvitation)}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

function renderInvitation(invitation: IInvitation) {
  return (
    <TableRow
      key={invitation.invitationId}
      sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
    >
      <TableCell component="th" scope="row">
        <Moment format="MM/DD" date={invitation.inviteesArrivalTimestamp} />
      </TableCell>
      <TableCell align="right">{invitation.inviteesAdmitted}</TableCell>
      <TableCell align="right">{invitation.inviteesAmount}</TableCell>
      <TableCell align="right">{invitation.isActive ? "✓" : "X"}</TableCell>
      <TableCell align="right">{invitation.commentForGuard}</TableCell>
    </TableRow>
  );
}
