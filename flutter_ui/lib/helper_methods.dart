import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:invitease/providers/new_invitation_provider.dart';
import 'package:invitease/screens/inviter/inviter.dart';
import 'package:invitease/screens/inviter/select_time.dart';
import 'global_variable.dart';

class HelperMethods {
  static String dateToString(DateTime time) {
    String text = '';
    String Hm = DateFormat.Hm().format(time);
    switch (time.weekday) {
      case DateTime.sunday:
        text = '$Hm ראשון ';
        break;
      case DateTime.monday:
        text = '$Hm שני ';
        break;
      case DateTime.tuesday:
        text = '$Hm שלישי ';
        break;
      case DateTime.wednesday:
        text = '$Hm רביעי ';
        break;
      case DateTime.thursday:
        text = '$Hm חמישי ';
        break;
      case DateTime.friday:
        text = '$Hm שישי ';
        break;
      case DateTime.saturday:
        text = '$Hm שבת ';
        break;
    }
    return text;
  }

  static Future<void> updateInvitation(
      {required String invitationId,
      int? numberOfInvitees,
      String? commentForGuard}) async {
    Map<String, dynamic> updateMap = {
      'invitees_amount': numberOfInvitees,
      'comment_for_guard': commentForGuard
    };
    updateMap.removeWhere((key, value) => value == null || value == 'null');
    var response = await http.post(Uri.http(
      'backend.localhost',
      'inviter/edit_invitation/$invitationId',
    ), headers: {'Content-Type': 'application/json'},
        encoding: Encoding.getByName('UTF-8'),
        body: jsonEncode(updateMap,)
    );

  }

  static Future<void> changeAdmittedInvitees(
      {required String invitationId, required int newAmount}) async {
    Map<String, dynamic> updateMap = {'invitees_admitted': '$newAmount'};
    updateMap.removeWhere((key, value) => value == null || value == 'null');
    var response = await http.post(
        Uri.http('backend.localhost', 'guard/change_admitted/$invitationId',
            updateMap),
        headers: {'Content-Type': 'application/json'},
        encoding: Encoding.getByName('UTF-8'),
    body: jsonEncode({
'invitees_admitted': '$newAmount'
    },),);

  }

  static DateTime getUpcommingWeekday(int weekday){
    DateTime now = DateTime.now();


DateTime upcommingWeekDayDate =  DateTime(now.year, now.month, now.day);
    while(upcommingWeekDayDate.weekday!=weekday)
    {
      upcommingWeekDayDate=upcommingWeekDayDate.add(Duration(days: 1));
    }
    return upcommingWeekDayDate;

  }

  static Duration timeRangeToDuration(TimeRange time){
    switch(time){
      case TimeRange.night:
        return Duration(hours: 20);
      case TimeRange.evening:
        return Duration(hours: 16);
      case TimeRange.noon:
        return Duration(hours: 12);

      case TimeRange.morning:
        return Duration(hours: 8);

    }


  }


  static Future<void> createNewInvitation(BuildContext context) async {
    int inviteesAmount = context.read<NewInvitationProvider>().numberOfInvitees;
    String comment = context.read<NewInvitationProvider>().commentForGuard;
    DateTime inviteesArrivalTimestamp =  context.read<NewInvitationProvider>().inviteesArrivalDate!.add( context.read<NewInvitationProvider>().inviteesArrivalHour!);
    int epochTime = inviteesArrivalTimestamp.millisecondsSinceEpoch ~/ 1000;
try {
  var response = await http.post(
    //todo change to Uri.http
      Uri.parse('http://backend.localhost/inviter/invite?user_id=$userId'),
      body: jsonEncode(
        {
          'user_id': userId,
          'invitees_amount': '$inviteesAmount',
          'invitees_arrival_timestamp_epoch': '$epochTime',
          'comment_for_guard': comment
        },
      ),
      headers: {'Content-Type': 'application/json'},
      encoding: Encoding.getByName('UTF-8'));
} catch (e){
  print(e);
  Navigator.of(context).popUntil(ModalRoute.withName(InviterScreen.screenId));
}
  }
}
