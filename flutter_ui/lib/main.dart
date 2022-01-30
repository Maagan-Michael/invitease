import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:invitease/providers/new_invitation_provider.dart';
import 'package:invitease/screens/admin.dart';
import 'package:invitease/screens/guard.dart';
import 'package:invitease/screens/inviter/invitation_details.dart';
import 'package:invitease/screens/inviter/invitation_details.dart';
import 'package:invitease/screens/inviter/invitation_time.dart';
import 'package:invitease/screens/inviter/inviter.dart';
import 'package:invitease/screens/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (ctx) => NewInvitationProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.screenId,
      routes: {
        LoginScreen.screenId: (context) => LoginScreen(),
        InviterScreen.screenId: (context) => InviterScreen(),
        GuardScreen.screenId: (context) => GuardScreen(),
        AdminScreen.screenId: (context) => AdminScreen(),
        InvitationTime.screenId: (context) => InvitationTime(),
        InvitationDetails.screenId: (context) => InvitationDetails(),
      },
    );
  }
}
