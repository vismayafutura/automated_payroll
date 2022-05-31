import 'package:automated_payroll/Pages/user/View_notification.dart';
import 'package:automated_payroll/Pages/user/user_login.dart';
import 'package:automated_payroll/Pages/hr/view_employee.dart';
import 'package:flutter/material.dart';

import 'HR_view_chat_replay.dart';
import '../../hr/add_person.dart';
import '../user/view_location.dart';
import 'addnotification.dart';
import 'approval.dart';

class hr_dash extends StatefulWidget {
  const hr_dash({Key key}) : super(key: key);

  @override
  _hr_dashState createState() => _hr_dashState();
}

class _hr_dashState extends State<hr_dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "login");
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Center(child: Text("Hr Home")),
        backgroundColor: Colors.grey,
        centerTitle: false,
      ),
      body: Container(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => UserLocatio()));
            //   },
            //
            //   child: Card(
            //     shadowColor: Colors.black,
            //     child:   Container(
            //       padding: const EdgeInsets.all(8),
            //       child:  Column(
            //         children: [
            //           Center(
            //             child: Icon(Icons.location_on,size: 100,color: Colors.black,),
            //           ),
            //           Center(child: Text('View Location', style: TextStyle(fontSize: 15,color: Colors.black))),
            //         ],
            //       ),
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HrViewAndReplay()));
              },
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.reply,
                          size: 60,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                          child: Text('View/Replay',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black))),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => viewemployee()));
            //   },
            //   child: Card(
            //     shadowColor: Colors.black,
            //     child:   Container(
            //       padding: const EdgeInsets.all(8),
            //       child:  Column(
            //         children: [
            //           Center(
            //             child: Icon(Icons.person,size: 100,color: Colors.black,),
            //           ),
            //           Center(child: Text('View Employee', style: TextStyle(fontSize: 15,color: Colors.black))),
            //         ],
            //       ),
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNotification()));
              },
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
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
                          child: Text('Add Notification',
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
                Navigator.pushNamed(context, "ApprovalAttendance");
              },
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.approval,
                          size: 60,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                          child: Text('Attendance',
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
                Navigator.pushReplacementNamed(context, "login");
              },
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
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
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
