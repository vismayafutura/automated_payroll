// import 'dart:convert';
//
// import 'package:automated_payroll/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart'as http;
// import 'package:intl/intl.dart';
//
// import '../../empoy_model.dart';
// class ApprovalAttendance extends StatefulWidget {
//   const ApprovalAttendance({Key key}) : super(key: key);
//
//   @override
//   _ApprovalAttendanceState createState() => _ApprovalAttendanceState();
// }
//
// class _ApprovalAttendanceState extends State<ApprovalAttendance> {
//
//   List<empResult> model = [];
//
//   String loginId = "";
//   Resultdata() async {
//
//     var url = "http://192.168.140.86/automated_payrole/employee_id.php";
//
//     http.Response response = await http.post(Uri.parse(url));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//
//       print(data);
//       final notif = (data['result'] as List).map((e) => empResult.fromJson(e)).toList();
//
//       setState(() {
//         model = notif;
//
//
//       });
//     }
//   }
//
//
//
//   approvalData({date}) async {
//
//     var parameters = {
//       "current_date": date,};
//     http.Response result = await http
//         .post(Uri.parse(baseurl+"Attendance_apprv.php"), body: parameters);
//     if (result.statusCode == 200){
//
//       print(result.body);
//
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(result.body)));
//       Navigator.pushReplacementNamed(context, "dashboard");
//     }
//     print(parameters);}
//
//
//
//   @override
//   void initState() {
//     Resultdata();
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(appBar: AppBar(title: Row(children: [SizedBox(width: 50,),Text("Attendance")],),),
//
//       body:getbody(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           setState(() {
//             approvalData(date: DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),);
//           } );//Navigator.pushNamed(context, "dashboard");
//         },child: Text("Approve"),
//       ),
//     );
//   }
//   Widget getbody() {
//     return ListView.builder(
//         itemCount: model.length,
//         itemBuilder: (context, index) {
//           empResult chats = model.elementAt(index);
//
//           return getcard(username: chats.username);
//         });
//   }
// }
// Widget getcard({
//   String username,
//
// }) {
//   return InkWell(
//     onLongPress: () {},
//     child: Card(
//         child: Column(
//           children: [
//
//
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [Text("${username}")],
//                   ),
//                 )
//               ],
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             ),
//           ],
//         )),
//
//
//   );
// }
// // // Column(
// // // children: [
// // // ElevatedButton(
// // // style: ElevatedButton.styleFrom(
// // // primary: Colors.blue, //background color of button
// // // side: BorderSide(width:3, color:Colors.brown), //border width and color
// // // elevation: 3, //elevation of button
// // // shape: RoundedRectangleBorder( //to set border radius to button
// // // borderRadius: BorderRadius.circular(30)
// // // ),
// // // padding: EdgeInsets.all(20)
// // // ),
// //
// // child: Text("Approve")
// // // ),
// // // ],
// // // )
import 'dart:convert';

import 'package:automated_payroll/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../empoy_model.dart';

class ApprovalAttendance extends StatefulWidget {
  const ApprovalAttendance({Key key}) : super(key: key);

  @override
  _ApprovalAttendanceState createState() => _ApprovalAttendanceState();
}

class _ApprovalAttendanceState extends State<ApprovalAttendance> {
  List<empResult> model = [];

  String loginId = "";
  bool noData = false;
  Resultdata() async {
    var url = "http://192.168.68.133/automated_payrole/attandance.php";

    http.Response response = await http.post(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print(data);
      if (data[0]['message'] != 'failed') {
        final notif = (data as List).map((e) => empResult.fromJson(e)).toList();
        print(' notif $notif');
        setState(() {
          model = notif;
        });
      } else {
        setState(() {
          noData = true;
        });
      }
    }
  }

  approvalData({date}) async {
    var parameters = {
      "current_date": date,
    };
    http.Response result = await http
        .post(Uri.parse(baseurl + "Attendance_apprv.php"), body: parameters);
    if (result.statusCode == 200) {
      print(result.body);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.body)));
      Navigator.pushReplacementNamed(context, "dashboard");
    }
    print(parameters);
  }

  @override
  void initState() {
    Resultdata();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Text("Attendance")
          ],
        ),
      ),
      body: noData
          ? Center(
              child: Text('no data'),
            )
          : getbody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            approvalData(
              date: DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
            );
          }); //Navigator.pushNamed(context, "dashboard");
        },
        child: Text("Approve"),
      ),
    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          empResult chats = model.elementAt(index);
          print(chats.latitude);
          return getcard(
              username: chats.username,
              latitude: chats.latitude,
              longitude: chats.longitude);
        });
  }
}

Widget getcard({
  String username,
  var latitude,
  var longitude,
}) {
  return InkWell(
      onLongPress: () {},
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text("${username}"),
          // subtitle:
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${latitude}"),
              Text("${longitude}"),
            ],
          ),
        ),
      )

          //     Column(
          //   children: [
          //     Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Column(
          //             children: [

          //             ],
          //           ),
          //         )
          //       ],
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     ),
          //   ],
          // )),
          ));
}
// // Column(
// // children: [
// // ElevatedButton(
// // style: ElevatedButton.styleFrom(
// // primary: Colors.blue, //background color of button
// // side: BorderSide(width:3, color:Colors.brown), //border width and color
// // elevation: 3, //elevation of button
// // shape: RoundedRectangleBorder( //to set border radius to button
// // borderRadius: BorderRadius.circular(30)
// // ),
// // padding: EdgeInsets.all(20)
// // ),
//
// child: Text("Approve")
// // ),
// // ],
// // )