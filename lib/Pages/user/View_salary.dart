import 'dart:convert';

import 'package:automated_payroll/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../salary_model.dart';
class ViewSalary extends StatefulWidget {
  const ViewSalary({Key key}) : super(key: key);

  @override
  _ViewSalaryState createState() => _ViewSalaryState();
}

class _ViewSalaryState extends State<ViewSalary> {
  List<SalResult> model = [];
  var loginId;
  getChatResultdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginId = prefs.getString('user') ?? "";
    var userdata = {
      "id":loginId,

    };
    var url = baseurl+"salary_view.php";


    http.Response response = await http.post(Uri.parse(url),body: userdata);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final chat = Salary_model.fromJson(data);
      setState(() {
        model = chat.result;
        print(model);
      });

    }

  }

  @override
  void initState() {
    getChatResultdata();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          children: [SizedBox(width: 90,),
            Text("View Salary"),
          ],
        ),
        centerTitle: false,

      ),



      body: getbody(),
    );

  }
  Widget getbody() {

    return ListView.builder(itemCount: model.length,
        itemBuilder: (context,index){
          SalResult chats = model.elementAt(index);
          return getcard(date:chats.month ,salary:chats.salary);
        });
  }
  Widget getcard({
    String date,
    String salary,



  })
  {

    return InkWell(onLongPress: (){
    },
      child: Card(
          child: Column(
            children: [
              Row(children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Month:  ${date}" ),
              )],),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("salary :   ₹${salary}"),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),


            ],
          )),
    );
  }

}

