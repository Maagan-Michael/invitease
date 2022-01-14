import 'package:flutter/material.dart';

class NewInvitationProvider with ChangeNotifier {
  DateTime? inviteesArrivalDate;
  Duration? inviteesArrivalHour;
  int numberOfInvitees = 1;
  String commentForGuard = '';

  void increment() {
    numberOfInvitees++;
    if (numberOfInvitees > 5) {
      numberOfInvitees = 5;
    } else if (numberOfInvitees < 1) {
      numberOfInvitees = 1;
    }
    notifyListeners();
  }

  void decrement() {
    numberOfInvitees--;
    if (numberOfInvitees > 5) {
      numberOfInvitees = 5;
    } else if (numberOfInvitees < 1) {
      numberOfInvitees = 1;
    }
    notifyListeners();
  }

  void changeComment(String comment) {
    commentForGuard = comment;
    notifyListeners();
  }

  void changeDate(DateTime? date) {
    inviteesArrivalDate = date;
    notifyListeners();
  }

  void changeHour(Duration? hour) {
    inviteesArrivalHour = hour;
    notifyListeners();
  }
}
