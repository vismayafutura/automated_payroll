import 'package:automated_payroll/Pages/user/camara.dart';
import 'package:automated_payroll/Pages/locationcount.dart';
import 'package:flutter/material.dart';

import '../user/view_location.dart';

class user_personal_info extends StatefulWidget {
  const user_personal_info({Key key}) : super(key: key);

  @override
  _user_personal_infoState createState() => _user_personal_infoState();
}

class _user_personal_infoState extends State<user_personal_info> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: size.height * 0.3),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),

            ),
            SizedBox(height: size.height * 0.03),

        ButtonTheme(
          minWidth: 305.0,
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => location_camara()));
            },
            child: Text("Update picture"),
          ),
        ),

            SizedBox(height: size.height * 0.03),

            ButtonTheme(
              minWidth: 305.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserLocatio()));
                },
                child: Text("My location"),
              ),
            ),

          ],

        ),

      ),

    );
  }
}
