import 'package:flutter/material.dart';
import 'package:invitease/helper_methods.dart';
import 'package:invitease/models/invitation/invitation.dart';

import 'edit_invitation.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({Key? key, required this.invitation, required this.fetchInvitations}) : super(key: key);
  final Invitation invitation;
  final Function fetchInvitations;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    String time =
        HelperMethods.dateToString(invitation.invitees_arrival_timestamp);
    String date =
        '${invitation.invitees_arrival_timestamp.day}/${invitation.invitees_arrival_timestamp.month}';
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      elevation: 10,
      color: Colors.blue[50],
      child: Container(
        height: height * 0.4,
        width: width * 0.25,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(date, style: TextStyle(fontSize: 20)),
                Spacer(),

                InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (cxt) => EditInvitationDialog(
                          invitationId: invitation.invitation_id,
                          userId: invitation.user_id,
                          fetchInvitations: fetchInvitations,
                          inviteesAmount: invitation.invitees_amount,
                          messageText: invitation.comment_for_guard,
                        ));
                  },
                  child: Row(
                    children: [
                      Text(
                        'עריכה',
                        style: TextStyle(fontSize: 20),
                      ),
                  Icon(
                    Icons.edit,
                    size: 30,
                  ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${invitation.invitees_admitted}',
                  style: TextStyle(fontSize: 60),
                ),
                Text(
                  '/${invitation.invitees_amount}',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
            Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
