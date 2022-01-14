import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:webtest1/helper_methods.dart';
import 'package:webtest1/models/invitation/invitation.dart';
import 'package:webtest1/screens/inviter/invitation_time.dart';
import 'package:webtest1/screens/inviter/edit_invitation.dart';
import 'package:webtest1/screens/inviter/invitation_card.dart';
import 'package:webtest1/widgets/custom_button.dart';

class InviterScreen extends StatefulWidget {
  const InviterScreen({Key? key}) : super(key: key);
  static const screenId = '/inviter_screen';

  @override
  _InviterScreenState createState() => _InviterScreenState();
}

class _InviterScreenState extends State<InviterScreen> {
  int inviteesAmount = 1;
  int? selectedDay;
  String userId = 'ce170212-7242-4f56-9298-d84b521eaedd';
  List<Invitation> myInvitations = [];

  void fetchInvitations(String userId) async {
    var response = await http.get(
      Uri.parse(
          'http://invitease.localhost/inviter/invitations?user_id=$userId'),
    );
    var jsonList = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    myInvitations = [];
    for (Map<String, dynamic> json in jsonList) {
      Invitation invitation = Invitation.fromJson(json);
      // if (invitation.is_active) {
      //   myInvitations.add(invitation);
      // }
      myInvitations.add(invitation);
    }
    myInvitations.sort((a, b) =>
        a.invitees_arrival_timestamp.compareTo(b.invitees_arrival_timestamp));
    setState(() {});
  }



  @override
  void initState() {
    fetchInvitations(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Spacer(),
              CustomButton(
                func: () async{
                 await Navigator.of(context)
                      .pushNamed(InvitationTime.screenId);
                 if(mounted){
                   fetchInvitations(userId);
                 }
                },
                text: 'הזמינו',
              ),
              Spacer(),
              Container(
                height: height * 0.4,
                width: width,
                color: Colors.blue[300],
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: width * 0.8,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (ctx, index) {
                          Invitation invitation = myInvitations[index];

                          return InvitationCard(
                            invitation: invitation,
                            fetchInvitations: fetchInvitations,
                          );
                        },
                        itemCount: myInvitations.length,
                      ),
                    ),
                    Divider(
                      color: Colors.blue[100],
                      thickness: 2,
                    ),
                    Container(
                      height: height * 0.4,
                      width: width * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(height * 0.02),
                            child: Text(
                              'הזמנות שלי',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )


          //     buildSubtitle(height, 'הודעה לשומר/ת'),
          //     Container(
          //       width: width * 0.3,
          //       child: TextField(
          //         controller: textController,
          //         textDirection: TextDirection.rtl,
          //         decoration: InputDecoration(
          //             hintText: 'רשמו כאן', hintTextDirection: TextDirection.rtl),
          //         maxLength: 140,
          //       ),
          //     ),
          //     SizedBox(
          //       height: height * 0.025,
          //     ),
          //     ElevatedButton(
          //       onPressed: () async {
          //         if (selectedDay == null) {
          //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(height:height*0.1 ,alignment: Alignment.center, child: Text('בבקשה הכניסו יום הגעה'))));
          //         }else {
          //           await createNewInvitation(selectedDay!);
          //           fetchInvitations(userId);
          //           showDialog(
          //               context: context,
          //               builder: (ctx) =>
          //                   Dialog(
          //                     child: Container(
          //                       width: width * 0.5,
          //                       height: height * 0.5,
          //                       child: Column(
          //                         children: [
          //                           Spacer(),
          //                           Text(
          //                             ' :) הזמנה נרשמה בהצלחה',
          //                             style: TextStyle(fontSize: 30),
          //                           ),
          //                           Spacer(),
          //                           ElevatedButton(
          //                             onPressed: () {
          //                               Navigator.of(context).pop();
          //                             },
          //                             child: Text('!אחלה'),
          //                           ),
          //                           SizedBox(
          //                             height: height * 0.05,
          //                           )
          //                         ],
          //                       ),
          //                     ),
          //                   ));
          //         }
          //       },
          //       child: Text('שליחת הזמנה'),
          //     ),
          //     myInvitationsRowTitle(width: width, height: height),
          //     Container(
          //       width: width,
          //       height: height * 0.3,
          //       padding: EdgeInsets.symmetric(horizontal: 50),
          //       child: ListView.builder(
          //         itemCount: myInvitations.length,
          //         itemBuilder: (ctx, index) {
          //           return myInvitationsRow(
          //               invitation: myInvitations[index],
          //               height: height,
          //               width: width);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }

  Widget myInvitationsRowTitle(
      {required double height, required double width}) {
    return Container(
        height: height * 0.1,
        width: width,
        color: Colors.grey[200],
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              buildDataCell(width * 0.07, 'כמה נכנסו'),
              buildDataCell(width * 0.07, 'כמה הוזמנו'),
              buildDataCell(width * 0.15, 'יום הגעה'),
              buildDataCell(width * 0.15, 'הודעה לשומר/ת'),
              buildDataCell(width * 0.15, 'יצירת ההזמנה'),
              buildDataCell(width * 0.2, 'מזהה הזמנה'),
              buildDataCell(width * 0.1, 'עריכה'),
            ],
          ),
        ));
  }

  Widget myInvitationsRow({
    required Invitation invitation,
    required double height,
    required double width,
  }) {
    return Container(
        height: height * 0.1,
        width: width,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              buildDataCell(
                  width * 0.07, invitation.invitees_admitted.toString()),
              buildDataCell(
                  width * 0.07, invitation.invitees_amount.toString()),
              buildDataCell(width * 0.15,
                  invitation.invitees_arrival_timestamp.toString()),
              buildDataCell(
                  width * 0.15, invitation.comment_for_guard.toString()),
              buildDataCell(
                  width * 0.15, invitation.creation_timestamp.toString()),
              buildDataCell(width * 0.2, invitation.invitation_id),
              Container(
                width: width * 0.05,
                height: height * 0.1,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (cxt) => EditInvitationDialog(
                              invitationId: invitation.invitation_id,
                              userId: userId,
                              fetchInvitations: fetchInvitations,
                              inviteesAmount: invitation.invitees_amount,
                              messageText: invitation.comment_for_guard,
                            ));
                  },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(Icons.edit),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildDataCell(double width, String text) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: SelectableText(text),
    );
  }

  InkWell buildDayBox(double height, String dayText, int weekDay) {
    bool selected = weekDay == selectedDay;
    return InkWell(
      onTap: () {
        if (selectedDay == weekDay) {
          selectedDay = null;
        } else {
          selectedDay = weekDay;
        }
        setState(() {});
      },
      child: Container(
        height: height * 0.075,
        width: height * 0.075,
        decoration: BoxDecoration(
            border: Border.all(), color: selected ? Colors.blue : null),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(dayText),
        ),
      ),
    );
  }

  Container buildSubtitle(double height, String text) {
    return Container(
      height: height * 0.04,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(text),
      ),
    );
  }
}
