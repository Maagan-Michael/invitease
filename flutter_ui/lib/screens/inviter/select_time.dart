import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/src/provider.dart';
import 'package:invitease/helper_methods.dart';
import 'package:invitease/providers/new_invitation_provider.dart';

enum TimeRange{
  morning,
  noon,
  evening,
  night
}
class SelectTime extends StatefulWidget {

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeRange? selectedTime;

  void selectTime(TimeRange time){
    if(time == selectedTime){
      selectedTime = null;
      context.read<NewInvitationProvider>()
          .changeHour(null);
    }else{
      selectedTime = time;
      context.read<NewInvitationProvider>()
          .changeHour(HelperMethods.timeRangeToDuration(time));
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Container(
      width: width,
      child: Column(
        children: [
          Text(
            'אזור זמן',
            textDirection: ui.TextDirection.rtl,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            buildTimeRangeBox(height, 'לילה', TimeRange.night),
            SizedBox(
              width: height * 0.02,
            ),
            buildTimeRangeBox(height, 'ערב', TimeRange.evening),
            SizedBox(
              width: height * 0.02,
            ),
            buildTimeRangeBox(height, 'צוהוריים', TimeRange.noon),
            SizedBox(
              width: height * 0.02,
            ),
            buildTimeRangeBox(height, 'בוקר', TimeRange.morning),
          ],),
        ],
      ),
    );
  }


  InkWell buildTimeRangeBox(double height, String timeRangeText, TimeRange time) {
    bool selected = selectedTime == time;
    return InkWell(
      onTap: () => selectTime(time),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white)),
        color: selected ? Colors.orangeAccent[100] : Colors.white,

        child: Container(
          height: height * 0.1,
          width: height * 0.2,
padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
// border: Border.all(color: Colors.white),
//               ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(timeRangeText,style: TextStyle(color:selected ?  Colors.white :Colors.black),textDirection: ui.TextDirection.rtl,),
          ),
        ),
      ),
    );
  }
}
