import 'dart:convert';

import 'package:automated_payroll/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Hrview_chat_model.dart';
import '../../models/user_chatmodel.dart';

class HrViewAndReplay extends StatefulWidget {
  const HrViewAndReplay({Key key}) : super(key: key);

  @override
  _HrViewAndReplayState createState() => _HrViewAndReplayState();
}

class _HrViewAndReplayState extends State<HrViewAndReplay> {
  List<HrChatResult> model = [];
  var loginId;
  getChatResultdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginId = prefs.getString('user') ?? "";
    // var Hrdata = {
    //   "login_id":Login_id,
    //
    // };
    var url = baseurl + "hr_view.php";

    http.Response response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final Hrchat = Hr_chatmodel.fromJson(data);
      setState(() {
        model = Hrchat.result;
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
        title: Row(
          children: [
            SizedBox(
              width: 100,
            ),
            Text("Messages"),
          ],
        ),
      ),
      body: getbody(),
    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          HrChatResult chats = model.elementAt(index);
          return getcard(
              date: chats.date,
              personName: chats.personName,
              message: chats.message,
              Chatid: chats.chatId);
        });
  }

  Widget getcard({
    String date,
    String personName,
    String message,
    String Chatid,
  }) {
    return InkWell(
      onLongPress: () {
        return showalertdialogue();
      },
      child: Card(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("date : ${date} "),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [Text("messege id :  ${Chatid}")],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [Text("messege :  ${message}")],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      )),
    );
  }

  void showalertdialogue() {
    bool _validate = false;
    TextEditingController Replaycontroller = TextEditingController();
    TextEditingController idcontroller = TextEditingController();
    addStdData({replay, chat_id}) async {
      var parameters = {
        "replay": replay,
        "chat_id": chat_id,
      };
      http.Response result = await http.post(
          Uri.parse("http://192.168.68.133/automated_payrole/reply.php"),
          body: parameters);
      print(parameters);
      print("result from web : ${result.statusCode}");
      if (result.statusCode == 200) {
        var message = "Added Successfully";
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
        print(result.body);
      }
    }

    showDialog(
        context: context,
        builder: (Context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Center(child: Text("Reply")),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: idcontroller,
                      decoration: InputDecoration(hintText: "Message id"),
                    ),
                    TextField(
                      controller: Replaycontroller,
                      decoration: InputDecoration(
                        hintText: "Type text",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        RaisedButton(
                          onPressed: () {
                            addStdData(
                              chat_id: idcontroller.text,
                              replay: Replaycontroller.text,
                            );
                            Navigator.of(context).pop(showalertdialogue);
                            print(Replaycontroller.text);
                            //alert box clearing function!!!!!!
                            setState(() {
                              Replaycontroller.text.isEmpty
                                  ? _validate = true
                                  : _validate = false;
                            });
                          },
                          child: Text("send"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
// api for replay send must provide