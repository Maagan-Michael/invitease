import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:webtest1/helper_methods.dart';
import 'package:webtest1/providers/new_invitation_provider.dart';
import 'package:webtest1/screens/inviter/number_of_invitees_box.dart';
import 'package:webtest1/widgets/custom_button.dart';

import 'inviter.dart';

class InvitationDetails extends StatelessWidget {
  static const screenId = '/invitation_details_screen';
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'כמה מגיעים?',
              style: TextStyle(color: Colors.white, fontSize: 50),
              textDirection: ui.TextDirection.rtl,
            ),
            Spacer(),
            NumberOfInviteesBox(),
            Spacer(),
            Text(
              'הודעה לשומר/ת',
              style: TextStyle(color: Colors.white, fontSize: 50),
              textDirection: ui.TextDirection.rtl,
            ),
            Spacer(),
            Container(
              width: width * 0.3,
              child: TextField(
                controller: commentController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintText: 'רשמו כאן', hintTextDirection: TextDirection.rtl,hintStyle: TextStyle(color: Colors.white),counterStyle: TextStyle(color: Colors.white)),
                maxLength: 140,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(
              flex: 5,
            ),
            CustomButton(
                func: () async{
                  context
                      .read<NewInvitationProvider>()
                      .changeComment(commentController.text);
                 await HelperMethods.createNewInvitation(context );
                 Navigator.of(context).popUntil(ModalRoute.withName(InviterScreen.screenId));
                },
                text: 'סיימתי!'),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
