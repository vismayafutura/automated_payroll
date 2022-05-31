import 'dart:convert';
import 'package:automated_payroll/Pages/hr/hr_dashboard.dart';
import 'package:automated_payroll/models/notification_model.dart';
import 'package:automated_payroll/models/user_chatmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

TimeOfDay selectedTime = TimeOfDay.now();

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NChatResult> model = [];
  String loginId = "";
  getChatResultdata() async {
    var url = "http://192.168.68.133/automated_payrole/view_notifications.php";

    http.Response response = await http.post(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final notif =
          (data['result'] as List).map((e) => NChatResult.fromJson(e)).toList();

      setState(() {
        model = notif;
      });
    }
  }

  @override
  void initState() {
    getChatResultdata();
  }

  @override
  Widget build(BuildContext context) {
    print(model);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Notifications"),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
      ),
      body: getbody(),
    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          NChatResult chats = model.elementAt(index);
          print(chats.date);
          return getcard(date: chats.date, message: chats.messege);
        });
  }
}

Widget getcard({
  String date,
  String message,
}) {
  return InkWell(
    onLongPress: () {},
    child: Card(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${date} "),
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [Text("${message}")],
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ],
    )),
  );
}
