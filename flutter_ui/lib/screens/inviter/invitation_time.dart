import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:invitease/helper_methods.dart';
import 'package:invitease/providers/new_invitation_provider.dart';
import 'package:invitease/screens/inviter/invitation_details.dart';
import 'package:invitease/screens/inviter/select_time.dart';
import 'package:invitease/widgets/custom_button.dart';

class InvitationTime extends StatefulWidget {
  static const screenId = '/arrival_time_screen';

  @override
  State<InvitationTime> createState() => _InvitationTimeState();
}

class _InvitationTimeState extends State<InvitationTime> {
  bool holidayVariation = false;
  int? selectedDay;

  void selectDay(int weekDay) {
    if (weekDay == selectedDay) {
      selectedDay = null;
      context.read<NewInvitationProvider>().changeDate(null);
      context.read<NewInvitationProvider>().changeHour(null);
    } else {
      selectedDay = weekDay;
      context
          .read<NewInvitationProvider>()
          .changeDate(HelperMethods.getUpcommingWeekday(weekDay));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    bool didChoose =
        (context.watch<NewInvitationProvider>().inviteesArrivalDate != null &&
            context.watch<NewInvitationProvider>().inviteesArrivalHour != null);
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
              'מתי האורחים מגיעים?',
              style: TextStyle(color: Colors.white, fontSize: 50),
              textDirection: ui.TextDirection.rtl,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        holidayVariation = !holidayVariation;
                      });
                    },
                    child: Text(
                      'חגים',
                      style: TextStyle(color: Colors.blue[50]),
                    )),
                SizedBox(
                  width: width * 0.01,
                ),
                Text(
                  'באיזה יום?',
                  textDirection: ui.TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDayBox(height, "ש'", DateTime.saturday),
                    SizedBox(
                      width: height * 0.02,
                    ),
                    buildDayBox(height, "ו'", DateTime.friday),
                    SizedBox(
                      width: height * 0.02,
                    ),
                    if (holidayVariation)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDayBox(height, "ה'", DateTime.thursday),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          buildDayBox(height, "ד'", DateTime.wednesday),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          buildDayBox(height, "ג'", DateTime.tuesday),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          buildDayBox(height, "ב'", DateTime.monday),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          buildDayBox(height, "א'", DateTime.sunday),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: height * 0.25,
              child: selectedDay != null ? SelectTime() : null,
            ),
            Spacer(
              flex: 5,
            ),
            Container(
                height: height * 0.1,
                child: didChoose
                    ? CustomButton(
                        func: () {
                          Navigator.of(context)
                              .pushNamed(InvitationDetails.screenId);
                        },
                        text: 'קדימה!',
                        color: Colors.blue[100]!)
                    : null),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildDayBox(double height, String dayText, int weekDay) {
    bool selected = weekDay == selectedDay;
    return InkWell(
      onTap: () => selectDay(weekDay),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white)),
        color: selected ? Colors.orangeAccent[100] : Colors.white,
        child: Container(
          height: height * 0.075,
          width: height * 0.075,
//           decoration: BoxDecoration(
// border: Border.all(color: Colors.white),
//               ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              dayText,
              style: TextStyle(color: selected ? Colors.white : Colors.black),
              textDirection: ui.TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
