import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class locationcount extends StatefulWidget {
  const locationcount({Key key}) : super(key: key);

  @override
  _locationcountState createState() => _locationcountState();
}

class _locationcountState extends State<locationcount> {
  String _locationMessage = "";

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

    /////////////////hide location
    int a = 1;
    Geolocator.getPositionStream(
            // desiredAccuracy: LocationAccuracy.high, intervalDuration: Duration(minutes: 10,),
            )
        .listen((Position position) {
      a++;
      var loc = position == null
          ? 'Unknown'
          : position.latitude.toString() + ', ' + position.longitude.toString();
      setState(() {
        _locationMessage = loc + 'count $a';
      });
      addlocation(position.longitude.toString(), position.latitude.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  addlocation(lat, lon) async {
    var url = "http://192.168.68.127/automated_payrole/locationcount.php";
    var data = {
      "latitude": lat,
      "longitude": lon,
    };
    var res = await http.post(Uri.parse(url), body: data);
    var message = jsonDecode(res.body);
  }

  @override
  void initState() {
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Location")),
        body: Align(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(_locationMessage)]),
        ));
  }
}
