import 'dart:math';
import 'package:geofencing/main.dart';
import '../main.dart';
import 'user_location.dart';

class Object{
  List<dynamic> boundaries = [];
  List<UserLocation> points = [];
  int pointIndex = -1;
  double longitudeMin = 0, longitudeMax = 0, latitudeMin = 0, latitudeMax = 0;

  void addPoint(UserLocation point){
    points.add(point);
    pointIndex += 1;
  }

  void clearPoints(){
    points.clear();
  }

  void printPoints(){
    for(int i = 0; i < points.length; i++){
      print('\tLongitude: ${points[i].longitude}, Latitude: ${points[i].latitude}');
    }
    print('Boundaries\n');
    print('longitudeMin: $longitudeMin, longitudeMax: $longitudeMax, latitudeMin: ${latitudeMin}, latitudeMax: ${latitudeMax}');
    for(int i = 0; i < boundaries.length; i++){
      print(' ${boundaries[i][0]}, ${boundaries[i][1]}, ${boundaries[i][2]}, ${boundaries[i][3]}');
    }
  }

  void createObject(){
    //get min and max
    double a, b, c;
    longitudeMin = points[0].longitude;
    longitudeMax = points[0].longitude;
    latitudeMin = points[0].latitude;
    latitudeMax = points[0].latitude;
    for(int i = 0; i < pointIndex; i++){
      //print('pointLength: ${pointIndex}, i: $i');
      longitudeMin = min(longitudeMin, points[i].longitude);
      longitudeMax = max(longitudeMax, points[i].longitude);
      latitudeMin = min(latitudeMin, points[i].latitude);
      latitudeMax = max(latitudeMax, points[i].latitude);

      boundaries.add(createLine(points[i], points[i + 1]));
    }
    //print('$pointIndex');
    longitudeMin = min(longitudeMin, points[pointIndex].longitude);
    longitudeMax = max(longitudeMax, points[pointIndex].longitude);
    latitudeMin = min(latitudeMin, points[pointIndex].latitude);
    latitudeMax = max(latitudeMax, points[pointIndex].latitude);
    boundaries.add(createLine(points[0], points[pointIndex]));

    objectCount += 1;
    //objects[objectCount] = Object();
  }

  List createLine(UserLocation p1, UserLocation p2){
    double a, b, c, aMin, aMax, bMin, bMax;
    a = p2.longitude - p1.longitude;
    b = p2.latitude - p1.latitude;
    c = a * p2.longitude + b * p2.latitude;

    aMin = min(p1.longitude, p2.longitude);
    aMax = max(p1.longitude, p2.longitude);
    bMin = min(p1.latitude, p2.latitude);
    bMax = max(p1.latitude, p2.latitude);

    return [a, b, c, aMin, aMax, bMin, bMax];
  }
}