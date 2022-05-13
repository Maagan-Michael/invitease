
import * as React from 'react';
import { Invitation } from '../../models/invitation';
import Moment from 'react-moment';



export function UserInvitations()  {
    let userInvitations:Invitation[] = [
      {invitationId: 'asdf',
        userId: 'asdf',
        inviteesAmount: 3,
        inviteesAdmitted:2,
        inviteesArrivalTimestamp: new Date(),
        isActive: true,
        creationTimestamp:  new Date(),
        modifyTimestamp:  new Date(),
        commentForGuard: 'hey'}
    ];
  
const renderRows = function(){  return userInvitations.map((invitation) => <InvitaionRow invitation={invitation}/>)
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

  function InvitaionRow({invitation}:IInvitaionRowData){
    return (
      <tr>
        <td>
          {invitation.inviteesAdmitted}
        </td>
        <td>
          {invitation.inviteesAmount}
        </td>
        <td>
        <Moment format="MM/DD HH:mm" date= {invitation.inviteesArrivalTimestamp}>
        
          </Moment>
        </td>
        <td>
          {invitation.commentForGuard}
        </td>
        <td>
        <Moment format="MM/DD HH:mm"  date= { invitation.creationTimestamp}>
       
            </Moment>
        </td>
        <td>
          {invitation.isActive.toString()}
        </td>
      </tr>
    );
  }


  function InvitaionRows({invitations}:IInvitaionRowsData){
    return invitations.map((invitation) => <InvitaionRow invitation={invitation}/>)
  }

  interface IInvitaionRowData{
    invitation: Invitation
  }

  interface IInvitaionRowsData{
    invitations: Invitation[]
  }