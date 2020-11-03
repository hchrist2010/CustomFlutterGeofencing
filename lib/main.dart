import 'package:flutter/material.dart';
import 'package:geofencing/data_models/user_location.dart';
import 'package:geofencing/services/location_service.dart';
import 'package:provider/provider.dart';
import 'geofencing.dart';
import 'services/location_service.dart';
import 'data_models/user_location.dart';
import 'data_models/objects.dart';

void main() {
  runApp(MyApp());
}

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

  void initTestObject(){
    objects.add(Object());
    objects[0].addPoint(test1);
    objects[0].addPoint(test2);
    objects[0].addPoint(test3);
    objects[0].addPoint(test4);
    objects[0].createObject();
  }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initTestObject();
    return StreamProvider<UserLocation>.value(
      initialData: UserLocation(),
      value: LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => HomeView(),
            'GeoFencing': (context) => GeoFencing(),
          },
      )
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //objects.add(Object());
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
          body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
              MaterialButton(onPressed: (){
                objects[objectCount].addPoint(UserLocation(
                  longitude: userLocation.longitude,
                  latitude: userLocation.latitude,
                ));
              },
                child: Text('Capture Point'),
                color: Colors.blue,
              ),
              MaterialButton(onPressed: (){
                objects[objectCount].createObject();
              },
                child: Text('Create Object'),
                color: Colors.blue,
              ),
              MaterialButton(onPressed: (){
                while(objectCount != 0){
                  objects.remove(objectCount);
                  objectCount--;
                }
                objects.add(Object());

              },
                child: Text('Clear Points'),
                color: Colors.blue,
              ),
              MaterialButton(onPressed: (){
                Navigator.pushNamed(context, 'GeoFencing');
              },
                child: Text('GeoFence'),
                color: Colors.blue,
              ),
              MaterialButton(onPressed: (){
                for(int i = 0; i < objectCount; i++){
                  print('Object $i');
                  objects[i].printPoints();
                }
              },
                child: Text('Print Points'),
                color: Colors.blue,
              ),
            ],
          )    
        ),
    );
  }
}