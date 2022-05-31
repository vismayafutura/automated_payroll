// import 'dart:convert';
// import 'dart:io';
// import 'package:automated_payroll/Pages/hr/personal_info.dart';
// import 'package:automated_payroll/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class location_camara extends StatefulWidget {
//   const location_camara({Key key}) : super(key: key);
//
//   @override
//   _location_camaraState createState() => _location_camaraState();
// }
//
// class _location_camaraState extends State<location_camara> {
// var loginId;
// File imagefile;
//
//    File _image;
//   final picker = ImagePicker();
//   String _locationMessage = "";
//   String latitude,longitude = "";
//   String login_id="2";
//
//
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//
//       setState(() {
//         _locationMessage = 'Location services are disabled.';
//       });
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         setState(() {
//           _locationMessage = 'Location permissions are denied.';
//         });
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//
//     Geolocator.getLastKnownPosition().then((Position position) {
//       setState(() {
//         latitude = position.latitude.toString();
//         longitude = position.longitude.toString();
//         _locationMessage =
//             position.latitude.toString() + "${position.longitude}";
//       });
//     }).catchError((e) {
//       print(e);
//     });
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   void initState() {
//     _determinePosition();
//   }
//
//
//
//   ///////end location
//
//   void _getFormcamera() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     loginId = prefs.getString('user') ?? "";
//     var userdata = {
//     "id":loginId,};
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//     print(pickedFile.path);
//
//     setState(() {
//       imagefile = File(pickedFile.path);
//     });
//   }
//
//   Future<void> uploadImage() async {
//     String uploadurl = baseurl+"location.php";
//
//     try {
//       List<int> imageBytes = imagefile.readAsBytesSync();
//       String baseimage = base64Encode(imageBytes);
//       var param = {
//         'image': baseimage,
//         'latitude': latitude,
//         'longitude':longitude,
//         'login_id':loginId,
//
//       };
//       var response = await http.post(Uri.parse(uploadurl), body: param );
//       print(baseimage);
//       print("response body :${response.body}");
//       if (response.statusCode == 200) {
//         var jsondata = json.decode(response.body);
//         if (jsondata["error"]) {
//           print(jsondata["msg"]);
//         } else {
//           print("Upload successful");
//         }
//       } else {
//         print("Error during connection to server");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           imagefile != null
//               ? Container(
//             child: Image.file(imagefile),
//           )
//               : Container(
//             child: Icon(
//               Icons.camera_alt_sharp,
//               color: Colors.blueAccent,
//               size: MediaQuery.of(context).size.width * .6,
//             ),
//           ),
//
//           // Text(_locationMessage),
//
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: ElevatedButton(
//               child: Text('open camara'),
//               onPressed: () {
//                 _getFormcamera();
//               },
//             ),
//           ),
//
//
//
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: ElevatedButton(
//               child: Text('upload'),
//               onPressed: () {
//                 Fluttertoast.showToast(
//                     msg: "upload Successfully",
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
//                 );
//                 //Navigator.pushReplacementNamed(context, "user_dash");
//                Navigator.push(context, MaterialPageRoute(builder: (context) => user_personal_info()));
//                  getCurrentPosition();
//                 uploadImage();
//                 _determinePosition();
//               },
//             ),
//           ),
//
//         ],
//       ),
//
//
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:automated_payroll/Pages/hr/personal_info.dart';
import 'package:automated_payroll/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class location_camara extends StatefulWidget {
  const location_camara({Key key}) : super(key: key);

  @override
  _location_camaraState createState() => _location_camaraState();
}

class _location_camaraState extends State<location_camara> {
  var loginId;
  File imagefile;

  File _image;
  final picker = ImagePicker();
  String _locationMessage = "";
  String latitude,longitude = "";
  String login_id="2";


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      setState(() {
        _locationMessage = 'Location services are disabled.';
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied.';
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    Geolocator.getLastKnownPosition().then((Position position) {
      setState(() {
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
        _locationMessage =
            position.latitude.toString() + "${position.longitude}";
      });
    }).catchError((e) {
      print(e);
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    _determinePosition();
  }



  ///////end location

  void _getFormcamera() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginId = prefs.getString('user') ?? "";
    var userdata = {
      "id":loginId,};
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    print(pickedFile.path);

    setState(() {
      imagefile = File(pickedFile.path);
    });
  }

  Future<void> uploadImage() async {
    String uploadurl = baseurl+"location.php";

    try {
      List<int> imageBytes = imagefile.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var param = {
        'image': baseimage,
        'latitude': latitude,
        'longitude':longitude,
        'login_id':loginId,

      };
      print(param);
      var response = await http.post(Uri.parse(uploadurl), body: param );
      print(baseimage);
      print("response body :${response.body}");
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
      }
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(child: Icon(Icons.arrow_back_sharp),onTap: (){Navigator.pushReplacementNamed(context, "user_dash");},),),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          imagefile != null
              ? Container(
            child: Image.file(imagefile),
          )
              : Container(
            child: Icon(
              Icons.camera_alt_sharp,
              color: Colors.blueAccent,
              size: MediaQuery.of(context).size.width * .6,
            ),
          ),

          // Text(_locationMessage),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text('open camera'),
              onPressed: () {
                _getFormcamera();
              },
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text('Upload'),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Uploaded Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
                );
                //Navigator.pushReplacementNamed(context, "user_dash");
                Navigator.push(context, MaterialPageRoute(builder: (context) => user_personal_info()));
                //getCurrentPosition();
                uploadImage();
                _determinePosition();
              },
            ),
          ),

        ],
      ),


    );
  }
}
//UserLocatio
