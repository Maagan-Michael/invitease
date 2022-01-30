import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invitease/helper_methods.dart';
import 'package:invitease/screens/inviter/number_of_invitees_box.dart';

class EditInvitationDialog extends StatefulWidget {
  const EditInvitationDialog(
      {Key? key,
      required this.invitationId,
      required this.userId,
      required this.fetchInvitations, required this.inviteesAmount, required this.messageText})
      : super(key: key);
  final String invitationId;
  final String userId;
  final Function fetchInvitations;
  final int inviteesAmount;
  final String? messageText;

  @override
  _EditInvitationDialogState createState() => _EditInvitationDialogState();
}

class _EditInvitationDialogState extends State<EditInvitationDialog> {

  late int newNumberOfInvitees;
  final TextEditingController textController = TextEditingController();

  void changeInviteesAmount(int num) {
    setState(() {
      newNumberOfInvitees += num;
      if (newNumberOfInvitees < 1) {
        newNumberOfInvitees = 1;
      }
      if (newNumberOfInvitees > 5) {
        newNumberOfInvitees = 5;
      }
    });
  }

  Future<void> deleteInvitation(String invitationId) async {
    var response = await http.post(
      Uri.parse(
          'http://invitease.localhost/inviter/edit_invitation/$invitationId'),
      body: jsonEncode({'is_active': 'false'}),
      headers: {'Content-Type': 'application/json'}
    );
  }

  @override
  void initState() {

newNumberOfInvitees = widget.inviteesAmount;
if(widget.messageText != null){
textController.text = widget.messageText!;
}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Dialog(
      child: Container(
        width: width * 0.5,
        height: height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.05,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text('עריכת הזמנה'),
              ),
            ),
            Spacer(),
            NumberOfInviteesBox(),
            Container(
              width: width * 0.3,
              child: TextField(
                controller: textController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintText: 'רשמו כאן', hintTextDirection: TextDirection.rtl),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text('מחיקת הזמנה'),
                  onPressed: () async {
                    await deleteInvitation(widget.invitationId);
                    widget.fetchInvitations(widget.userId);
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('עדכון הזמנה'),
                  onPressed: () async {
                    String? newComment;
                    int? inviteesAmount;
                    if(widget.messageText != textController.text && textController.text.trim() != ''){
                      newComment = textController.text;
                    }
                    if(widget.inviteesAmount != newNumberOfInvitees && newNumberOfInvitees >0){
                     inviteesAmount = newNumberOfInvitees;
                    }
                    await HelperMethods.updateInvitation(invitationId: widget.invitationId,commentForGuard: newComment,numberOfInvitees: inviteesAmount);
                    widget.fetchInvitations(widget.userId);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
