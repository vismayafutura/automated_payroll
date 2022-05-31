import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Pages/hr/hr_dashboard.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController NameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController phonelController = TextEditingController();

  addmessage() async {
    String date = NameController.text;
    String person_name = AddressController.text;
    String Message = EmailController.text;
    String phone = phonelController.text;
    var url = "http://192.168.68.127/automated_payrole/chat_hr.php";
    var data = {
      "date": date,
      "person_name": person_name,
      "message": Message,
    };
    var res = await http.post(Uri.parse(url), body: data);
    var message = jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add person"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 60,
                child: TextFormField(
                  controller: NameController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      hintText: "Date"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 60,
                child: TextFormField(
                  controller: EmailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      hintText: "Person Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 60,
                child: TextFormField(
                  controller: phonelController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      )),
                      hintText: "Person Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 130,
                child: TextFormField(
                  controller: AddressController,
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
                      });

                      addmessage();
                      Fluttertoast.showToast(
                          msg: "Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity
                              .BOTTOM // Also possible "TOP" and "CENTER"
                          );
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>add_camp_details  ()));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => hr_dash()));
                    },
                    child: Text("Submit")),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
