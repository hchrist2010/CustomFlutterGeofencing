import 'dart:async';
import '../main.dart';

import 'package:location/location.dart';
import '../data_models/user_location.dart';

class GeoFence{
  UserLocation _currentLocation;
  var location = Location();
  Stream<bool> getLocation() async*{
    int i = 0; 
    i += 1;
    var userLocation = await location.getLocation();
    if(i % 2 == 0){
      yield true;
    }
    else{
      yield false;
    }
  }
}


/*
class LocationService {
  UserLocation _currentLocation;

  var location = Location();

  Stream<UserLocation> getLocation() async*{
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    yield _currentLocation;
  }

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      if (granted != null) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }
}



*/