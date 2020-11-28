import '../data_models/user_location.dart';
import '../data_models/objects.dart';
import '../main.dart';

List<bool> is_in_object(UserLocation currentLocation){
  double x = currentLocation.longitude;
  double y = currentLocation.latitude;
  List<bool> results = [];

  for(int i = 0; i < objectCount; i++){
    results.add(check(x, y, objects[i]));
  }


  return results;
}

bool check(double x, double y, Object object){
  int count = 0;
  //object.printPoints();

  if(x < object.longitudeMin || x > object.longitudeMax){
    return false;
  }
  if(y < object.latitudeMin || y > object.latitudeMax){
    return false;
  }

  for(int i = 0; i <object.boundaries.length; i++){
    if((object.boundaries[i][0] * x + object.boundaries[i][1] * y).abs() <= object.boundaries[i][2].abs()){
      count += 1;
    }
  }
  if(count % 2 == 1){
    return true;
  }
  return false;
}