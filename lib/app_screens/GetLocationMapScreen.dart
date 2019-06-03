import 'dart:async';

import 'package:air_miles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:async/async.dart';
//import 'package:geolocator/geolocator.dart';
class GetLocationMapScreen extends StatelessWidget {
  var location;


  @override
  Widget build(BuildContext context) {
    return GetLocationStateWidget();
  }

}
class GetLocationStateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {


    return GetLocationStated();
  }

}
class GetLocationStated extends State<GetLocationStateWidget>{
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  //var location = new Location();
  GoogleMapController _mapcontroller;
  Address useraddress;
  //Coordinates _coordinates;
  String _address="";
  StreamController<Map<String,double>> streamController;
  Location location;
  Map<String,double> currentLocation;
  //Geolocator geolocator = Geolocator();

  //Position userLocation;
  bool firstTime=true;
  CameraPosition _position;
  var subscription;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        _mapcontroller = controller;
                        _getLocation();

                      },


                      onCameraMove: (position) => {_position = position},
                      onCameraIdle: () => UpdateDateOnCamaraMove(),
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                             
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(left: 20),
                                    child: RaisedButton(
                                        onPressed: () => {Navigator.pop(context,useraddress)},
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: AppColors.backgoundColorRed),
                                  ),
                                ),
                                Flexible(
                                  child:Container(
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.all(5),
                                    child: Transform.scale(
                                      scale: 0.9,
                                      child: FloatingActionButton(onPressed: ()=>animateMapTOLatLong(),backgroundColor: Colors.white,
                                        child: Icon(Icons.my_location,color: Colors.black,size: 26,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Text(_address,
                                style:
                                TextStyle(fontSize: 18, color: AppColors.gray),
                              ),
                            )
                          ],
                        )),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.place,
                        size: 28,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  UpdateDateOnCamaraMove() async {
    print("UpdateDateOnCamaraMove");
    final coordinates =
    new Coordinates(_position.target.latitude, _position.target.longitude);
    print("UpdateDateOnCamaraMove222");
    List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    if (addresses == null) {
      print("then Null");
    }
    useraddress = addresses.first;
    _setAddress(useraddress.addressLine);
  }
  void _setAddress(String address) {
    setState(() {
      _address=address;
    });
  }
   _getLocation() async {

      location = new Location();
      Stream<Map<String,double>> userLocation;
      try{
       // location.onLocationChanged();
        userLocation = location.onLocationChanged();
        streamController=StreamController();
        streamController.addStream(userLocation);
      }catch(e){
       // Location().hasPermission()
        print("error location"+e.toString());
      }

      subscription= streamController.stream.listen((Map<String,double> map)=>{
      print(map["latitude"].toString()),


            currentLocation=map,
            animateMapTOLatLong(),

        subscription.cancel()

        //streamController.close()



      });

      if(userLocation==null){
        print("error locationNull");
      }

  }
  animateMapTOLatLong(){
    _mapcontroller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(currentLocation["latitude"],
            currentLocation["longitude"]),zoom: 16)));
  }

}