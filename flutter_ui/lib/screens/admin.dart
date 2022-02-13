import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invitease/models/user/user.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  static const screenId = '/admin_screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<User> users = [];

  void fetchUsers() async {
    var response = await http.get(
      Uri.parse('http://backend.localhost/admin/users'),
    );
    var jsonList = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    users = [];
    for (Map<String, dynamic> json in jsonList) {
      User user = User.fromJson(json);

      users.add(user);
    }
    setState(() {});
  }

  Future<void> updateUserRole(String userId, String role) async {
    var response = await http.post(
      Uri.parse('http://backend.localhost/admin/users/$userId/role/$role'),
    );
  }

  bool init = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    if (init == true) {
      fetchUsers();
      init = false;
    }

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'משתמשים',
              style: TextStyle(fontSize: 40),
            ),
            Container(
              height: height * 0.7,
              child: ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  tileColor: Colors.blueGrey[100],
                  title: Text(
                      '${users[index].user_role}  ${users[index].first_name} ${users[index].last_name} ${users[index].user_id}'),
                  trailing: ElevatedButton(
                    child: Text('Update User Role'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => Dialog(
                                child: Container(
                                  height: height * 0.3,
                                  width: width * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateUserRole(
                                              users[index].user_id, 'user');
                                          fetchUsers();

                                          Navigator.of(context).pop();
                                        },
                                        child: Text('User'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateUserRole(
                                              users[index].user_id, 'guard');
                                          fetchUsers();

                                          Navigator.of(context).pop();
                                        },
                                        child: Text('guard'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateUserRole(
                                              users[index].user_id, 'admin');
                                          fetchUsers();

                                          Navigator.of(context).pop();
                                        },
                                        child: Text('admin'),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                  ),
                ),
                itemCount: users.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
