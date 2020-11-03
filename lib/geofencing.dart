import 'dart:async';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'data_models/user_location.dart';
import 'services/geofence.dart';

import 'package:flutter/material.dart';

class GeoFencing extends StatefulWidget {
  @override
  _GeoFencingState createState() => _GeoFencingState();
}

class _GeoFencingState extends State<GeoFencing> {
  var loc = Colors.blue;
  @override
  Widget build(BuildContext context) {
    while(true){
        if(in_object() == true){
          loc = Colors.green;
          setState(() {
            
          });
          return Container(
            color: loc,
          );
      }else{
          loc = Colors.blue;
          setState(() {
            
          });
          return Container(
            color: loc,
          );
        }
      }
  }
}

Future in_object()async{
  Location location = Location();
  var userLocation = await location.getLocation();
  UserLocation _currentLocation = UserLocation(
    latitude: userLocation.latitude,
    longitude: userLocation.longitude,
  );
  print(_currentLocation.longitude);
}