// import 'dart:convert';
//
// import 'package:automated_payroll/models/user_chatmodel.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserChatView extends StatefulWidget {
//   const UserChatView({Key key}) : super(key: key);
//
//   @override
//   _UserChatViewState createState() => _UserChatViewState();
// }
// // user chat view
// class _UserChatViewState extends State<UserChatView> {
//   List<ChatResult> model = [];
//
//   String loginId = "";
//
//   TextEditingController Login_idController = TextEditingController();
//   TextEditingController NameController = TextEditingController();
//   TextEditingController MessageController = TextEditingController();
// var id;
//
//   addmessage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     loginId = prefs.getString('user') ?? "";
//
//     String Message = MessageController.text;
//
//     var url = "http://192.168.43.44/automated_payrole/chat_user.php";
//     var data = {
//       "Login_id": loginId,
//
//       "message": Message,
//     };
//     var res = await http.post(url, body: data);
//   }}