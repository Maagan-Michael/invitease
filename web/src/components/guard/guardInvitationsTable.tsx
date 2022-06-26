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

interface IInvitaionRowData {
  invitation: IInvitation
}

export function GuardInvitationsTable({ invitations }: IInvitations) {
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>שם</TableCell>
            <TableCell >נכנסו</TableCell>
            <TableCell >מוזמנים</TableCell>
            <TableCell >הכנסה</TableCell>
            <TableCell >הודעה</TableCell>
            <TableCell align="right">מחיקת הכנסה</TableCell>

          </TableRow>
        </TableHead>
        <TableBody>
          {invitations.map(renderInvitation)}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

function admittInvitee(){

  console.log("come in yo")
}

function unAdmittInvitee(){

  console.log("yo get outta here")
}

function renderInvitation(invitation: IInvitation) {
  return (
    <TableRow
      key={invitation.invitationId}
      sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
    >
     
      <TableCell>name</TableCell>
      <TableCell>{invitation.inviteesAdmitted}</TableCell>
      <TableCell>{invitation.inviteesAmount}</TableCell>
      <TableCell onClick={admittInvitee}>+</TableCell>
      <TableCell>{invitation.commentForGuard}</TableCell>
      <TableCell align="right" onClick={unAdmittInvitee}>-</TableCell>
    </TableRow>
  );
}
