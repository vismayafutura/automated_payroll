import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UserLocatio extends StatefulWidget {
  @override
  _UserLocatioState createState() => _UserLocatioState();
}

class _UserLocatioState extends State<UserLocatio> {
  Position _currentPosition;
  var lat = "";
  var lon = "";
  var address = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "LAT:$lat LON:$lon\n"
                    "$address"
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                getLoc();
              },
            ),
          ],
        ),
      ),
    );
  }

  getLoc() async {
    Position position = await Geolocator.getLastKnownPosition();
    _getAddressFromLatLng(position);
    setState(() {
      lat = position.latitude.toString();
      lon = position.longitude.toString();
    });
  }

  _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        address = "${place.locality},${place.postalCode}, ${place.country}";
        print(address);
      });
    } catch (e) {
      print(e);
    }
  }
  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }
}
