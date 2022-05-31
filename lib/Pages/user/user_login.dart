import 'dart:convert';

import 'package:automated_payroll/Pages/hr/hr_dashboard.dart';
import 'package:automated_payroll/Pages/user/camara.dart';
import 'package:automated_payroll/Pages/user/user_dashboard.dart';
import 'package:automated_payroll/components/background.dart';
import 'package:automated_payroll/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  int userid = 0;
  var myContext;

  loginData({Username, Password}) async {
    var parameters = {
      "mailid": Username,
      "password": Password,
    };
    http.Response result =
        await http.post(Uri.parse(baseurl + "login.php"), body: parameters);
    print(parameters);
    print("result from web : ${result.statusCode}");
    if (result.statusCode == 200) {
      print(result.body);
      var jsonObject = jsonDecode(result.body);
      print(jsonObject);
      var status = jsonObject['status'];
      print(jsonObject['status']);
      var message = "Invalid username or password";
      if (status == "success") {
        message = "Login successful";
        var userid = jsonObject['id'];
        print(userid);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("user", userid);
        // print("userrrrr${jsonObject['rol']}");
        if (jsonObject['rol'] == "user") {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => user_dash()));
        } else
          Navigator.pushNamed(context, 'hr_dash');
      }
      ScaffoldMessenger.of(myContext)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(labelText: "Username"),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    loginData(
                      Username: usernamecontroller.text,
                      Password: passwordcontroller.text,
                    );
                    usernamecontroller.clear();
                    passwordcontroller.clear();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: size.width * 25,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //   child: GestureDetector(
              //     onTap: () => {
              //       // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
              //     },
              //     child: Text(
              //       "upload photo and location",
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.bold,
              //           color: Color(0xFF2661FA)
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
