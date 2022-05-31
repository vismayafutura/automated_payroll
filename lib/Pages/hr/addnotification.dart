import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'hr_dashboard.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({Key key}) : super(key: key);

  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  TextEditingController MessageController = TextEditingController();

  addmessage({Message}) async {
    String Message = MessageController.text;

    var url = "http://192.168.68.133/automated_payrole/hr_notification.php";

    var data = {
      "messege": Message,
    };
    var res = await http.post(Uri.parse(url), body: data);
    var message = jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Add Notification"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 130,
                child: TextFormField(
                  controller: MessageController,
                  minLines: 5,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addmessage();
                        print(addmessage);
                      });

                      MessageController.clear();
                      Navigator.pushReplacementNamed(context, "dashboard");
                    },
                    child: Text("Submit")),
              ),
            ),
          ]),
    );
  }
}
