import 'package:flutter/material.dart';
import 'package:invitease/screens/inviter/inviter.dart';

import 'admin.dart';
import 'guard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const screenId = '/login_screen';

  void login(BuildContext context) {
   Navigator.of(context).pushNamedAndRemoveUntil(InviterScreen.screenId, (route) => false);
  }

  void loginAsGuard(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(GuardScreen.screenId, (route) => false);
  }

  void loginAsAdmin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(AdminScreen.screenId, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Text('Welcome To Invitease!'),
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: const Text('Login as Inviter'),
              onPressed: () => login(context),
            ),
            SizedBox(height: height*0.1,),
            ElevatedButton(
              child: const Text('Login as guard'),
              onPressed: () => loginAsGuard(context),
            ),
            SizedBox(height: height*0.1,),
            ElevatedButton(
              child: const Text('Login as admin'),
              onPressed: () => loginAsAdmin(context),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
