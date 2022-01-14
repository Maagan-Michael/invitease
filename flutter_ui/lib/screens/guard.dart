import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtest1/helper_methods.dart';
import 'package:webtest1/models/invitation/invitation.dart';

import 'basic_text_cell.dart';

class GuardScreen extends StatefulWidget {
  const GuardScreen({Key? key}) : super(key: key);
  static const screenId = '/guard_screen';

  @override
  _GuardScreenState createState() => _GuardScreenState();
}

class _GuardScreenState extends State<GuardScreen> {
  List<Invitation> invitations = [];
  List<Map<String, String>> names = [];

  Future<void> fetchInvitations() async {
    var response = await http.get(
      Uri.parse('http://invitease.localhost/guard/invitations'),
    );
    var jsonList = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    invitations = [];
    for (Map<String, dynamic> json in jsonList) {
      Invitation invitation = Invitation.fromJson(json);
      invitations.add(invitation);
    }
    invitations.sort((a, b) {
      if(a.invitees_amount == a.invitees_admitted){
        return 1;
      }else if(b.invitees_amount == b.invitees_admitted){
        return -1;
      }else{
        return a.invitees_arrival_timestamp.compareTo(b.invitees_arrival_timestamp);}
    });
await fetchNames();
setState(() {

});
  }

  Future<void> fetchNames() async {
    names = [];
    List<String> userIdList = invitations.map((user) => user.user_id).toList();

    if (userIdList.isNotEmpty) {
      var response = await http.get(
        Uri.http(
          'invitease.localhost',
          '/guard/user_names',
          {'user_id_list': userIdList},
        ),
        headers: {'Content-Type': 'application/json'},
      );

      List jsonList = jsonDecode(response.body) as List;
      for (var n in jsonList) {
        Map<String, String> name = {
          'user_id': n['user_id'],
          'first_name': n['first_name'],
          'last_name': n['last_name']
        };
        names.add(name);
      }
    }
  }

  @override
  void initState() {
    fetchInvitations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
          return Scaffold(
            body: Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * 0.05,
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: Text('הזמנות'),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  invitationsRowTitle(width: width, height: height),
                  Container(
                    width: width,
                    height: height * 0.7,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ListView.builder(
                      itemCount: invitations.length,
                      itemBuilder: (ctx, index) {
                        return invitationsRow(
                            invitation: invitations[index],
                            height: height,
                            width: width);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget invitationsRowTitle({required double height, required double width}) {
    return Container(
        height: height * 0.1,
        width: width * 0.7,
        color: Colors.blueGrey[100],
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              BasicTextCell(width: width * 0.1, text: 'פעולה'),
              BasicTextCell(width: width * 0.2, text: 'שם מזמינ/ה'),
              BasicTextCell(width: width * 0.075, text: 'כמה נכנסו'),
              BasicTextCell(width: width * 0.075, text: 'כמה הוזמנו'),
              BasicTextCell(width: width * 0.1, text: 'מועד הגעה'),
              BasicTextCell(width: width * 0.15, text: 'הודעה לשומר/ת'),
            ],
          ),
        ));
  }

  Widget invitationsRow({
    required Invitation invitation,
    required double height,
    required double width,
  }) {
    Map<String,String> nameMap = names.where((nameMap) => nameMap['user_id'] == invitation.user_id ).toList()[0];
    String userName = '${nameMap['first_name']} ${nameMap['last_name'
    ]}';
    return Container(
      height: height * 0.1,
      width: width,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Container(
              height: height * 0.1,
              width: width * 0.1,
              child: Row(
                children: [
                  InkWell(
                      onTap: () async {
                        if (invitation.invitees_admitted + 1 >
                                invitation.invitees_amount ||
                            invitation.invitees_admitted + 1 < 0) {
                        } else {
                          await HelperMethods.changeAdmittedInvitees(
                              invitationId: invitation.invitation_id,
                              newAmount: invitation.invitees_admitted + 1);
                         await fetchInvitations();
                         setState(() {

                         });
                        }
                      },
                      child: Icon(Icons.add)),
                  InkWell(
                      onTap: () async {
                        if (invitation.invitees_admitted - 1 >
                                invitation.invitees_amount ||
                            invitation.invitees_admitted - 1 < 0) {
                        } else {
                          await HelperMethods.changeAdmittedInvitees(
                              invitationId: invitation.invitation_id,
                              newAmount: invitation.invitees_admitted - 1);
                          await fetchInvitations();
                          setState(() {

                          });
                        }
                      },
                      child: Icon(Icons.remove))
                ],
              ),
            ),
            BasicTextCell(
                width: width * 0.2, text: userName, color: Colors.grey[200]!),
            BasicTextCell(
                width: width * 0.07,
                text: invitation.invitees_admitted.toString()),
            BasicTextCell(
                width: width * 0.07,
                text: invitation.invitees_amount.toString(),
                color: Colors.grey[200]!),
            BasicTextCell(
                width: width * 0.1,
                text: HelperMethods.dateToString(
                    invitation.invitees_arrival_timestamp)),
            BasicTextCell(
                width: width * 0.15,
                text: invitation.comment_for_guard.toString(),
                color: Colors.grey[200]!),
          ],
        ),
      ),
    );
  }


}
