import 'dart:async';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'data_models/user_location.dart';
import 'data_models/user_location.dart';
import 'data_models/user_location.dart';
import 'main.dart';
import 'data_models/user_location.dart';
import 'data_models/objects.dart';
import 'services/geofence.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

import 'services/geofence.dart';

List<Object> objects = [];
int objectCount = 0;

UserLocation test1 = UserLocation(
    latitude: 61.2180556,
    longitude: -149.9002778
  );
  UserLocation test2 = UserLocation(
    latitude: 40.7128,
    longitude: 74.0060
  );
  UserLocation test3 = UserLocation(
    latitude: 25.7617,
    longitude: 80.1918
  );
  UserLocation test4 = UserLocation(
    latitude: 19.8968,
    longitude: 155.5828
  );

  UserLocation current1 = UserLocation(
    latitude: 44.5646,
    longitude: 123.2620
  );

  UserLocation current2 = UserLocation(
    latitude: 51.5074,
    longitude: 0.1278
  );

class GeoFencing extends StatefulWidget {
  @override
  _GeoFencingState createState() => _GeoFencingState();
}

class _GeoFencingState extends State<GeoFencing> {
  List<bool> t = [];
  @override
  Widget build(BuildContext context) {
    objects.add(Object());
    objects[0].addPoint(test1);
    objects[0].addPoint(test2);
    objects[0].addPoint(test3);
    objects[0].addPoint(test4);

    objects[0].createObject();
    t = is_in_object(current1);

    if(t[0] == true){
      print('Worked!');
    }else{
      print('Didn\'t work');
    }
    return Container();
  }
}

