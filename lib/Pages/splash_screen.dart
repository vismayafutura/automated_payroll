import 'dart:async';

import 'package:automated_payroll/Pages/user/user_dashboard.dart';
import 'package:automated_payroll/Pages/user/user_login.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({Key key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:2),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         child: Image.asset("assets/images/splash_payrole.jpg",fit: BoxFit.fill,),),
    );
  }
}
