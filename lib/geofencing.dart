import 'data_models/user_location.dart';
import 'main.dart';
import 'services/geofence.dart';
import 'package:flutter/material.dart';

  UserLocation current1 = UserLocation(
    latitude: 45.862652,
    longitude: -122.816757
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
  List<bool> t2 = [];
  @override

  t1Results(){
    if(t[0] == true){
      return Text('Worked');
    }else{
      return Text('didn\'t work');
    }
  }
  t2Results(){
    if(t2[0] == true){
      return Text('Worked');
    }else{
      return Text('didn\'t work');
    }
  }


  Widget build(BuildContext context) {
    if(objectCount >= 1){
      t = is_in_object(current1);
      t2 = is_in_object(current2);
      print('${current1.latitude}, ${current1.longitude}');
      return Column(
        children: [
          t1Results(),
          t2Results(),
        ],
      );
    }
  }
}

