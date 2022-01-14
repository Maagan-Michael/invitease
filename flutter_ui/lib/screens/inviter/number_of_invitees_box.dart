import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:webtest1/providers/new_invitation_provider.dart';

class NumberOfInviteesBox extends StatelessWidget {
  const NumberOfInviteesBox({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    void  incrementInvitees(){
      context.read<NewInvitationProvider>().increment();

    } void  decrementInvitees(){
      context.read<NewInvitationProvider>().decrement();

    }
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => decrementInvitees(),
            child: Icon(
              Icons.remove,
              size: height * 0.1,
              color: Colors.white,
            ),
          ),
          Container(
            height: height * 0.1,
            width: height * 0.1,
            decoration: BoxDecoration(
              border: Border.all( color: Colors.white,),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                context.watch<NewInvitationProvider>().numberOfInvitees.toString(),
                style: TextStyle( color: Colors.white,),
              ),

            ),
          ),
          InkWell(
            onTap: () => incrementInvitees(),
            child: Icon(
              Icons.add,
              size: height * 0.1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
