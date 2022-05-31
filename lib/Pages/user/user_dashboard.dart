import 'package:automated_payroll/Pages/logout_details.dart';
import 'package:automated_payroll/Pages/hr/personal_info.dart';
import 'package:automated_payroll/Pages/user/user_chat_view_message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'View_salary.dart';
import '../hr/addnotification.dart';
import 'View_notification.dart';

class user_dash extends StatefulWidget {
  const user_dash({Key key}) : super(key: key);

  @override
  _user_dashState createState() => _user_dashState();
}

class _user_dashState extends State<user_dash> {
  TextEditingController pnamecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController messegecontroller = TextEditingController();

  String date = "";
  String pname = "";
  String messege = "";

  AddDetails({
    date,
    pname,
    messege,
  }) async {
    var parameters = {
      "first_name": pname,
      "last_name": pname,
      "username": messege,
    };
    // print(parameters);
    http.Response result = await http.post(
        Uri.parse("http://192.168.68.127/automated_payrole/chat_hr.php"),
        body: parameters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "logout");
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 100,
            ),
            Text("Home "),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Container(
          height: 600,
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              //   Container(
              //   padding: const EdgeInsets.all(8),
              //   child: const Text('First', style: TextStyle(fontSize: 20)),
              //   color: Colors.yellow,
              // ),

              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "location_camara");
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => user_personal_info()));
                },
                child: Container(
                  height: 20,
                  // shadowColor: Colors.black,
                  child: Card(
                    shadowColor: Colors.black,
                    // padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            Icons.location_on,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                            child: Text('Upload Attendance',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  //
                  //

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: Container(
                  height: 20,
                  child: Card(
                    shadowColor: Colors.black,
                    // padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            Icons.chat,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                            child: Text('Notifications',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserChatView()));
                },
                child: Container(
                  height: 50,
                  child: Card(
                    shadowColor: Colors.black,
                    // padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            Icons.message,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                            child: Text('chat/view',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewSalary()));
                },
                child: Container(
                  height: 50,
                  child: Card(
                    shadowColor: Colors.black,
                    // padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            Icons.monetization_on_sharp,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                            child: Text('View salary',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "logout");
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => logout()));
                },
                child: Container(
                  height: 10,
                  child: Card(
                    shadowColor: Colors.black,
                    // padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Icon(
                                Icons.logout,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                            Center(
                                child: Text('Logout',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black))),
                          ],
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
