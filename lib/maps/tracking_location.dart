import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingLocation extends StatefulWidget {
  const TrackingLocation({super.key});

  @override
  State<TrackingLocation> createState() => _TrackingLocationState();
}

class _TrackingLocationState extends State<TrackingLocation> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _myPosition = CameraPosition(
    target: LatLng(13.97816675220149, 80.24610977917436),
    zoom: 14
    );

    final List<Marker> _markers = <Marker>[
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(13.97816675220149, 80.24610977917436),
        infoWindow: InfoWindow(
          title: 'The title of the marker'
        )
        )
    ];

    Future<Position> getCurrentLocation()async{
     await Geolocator.requestPermission().then((value) {

     }).onError((error, stackTrace) {
      print('error'+error.toString());
     });

     return await Geolocator.getCurrentPosition();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tracking Location'),
      ),
      body:GoogleMap(
        initialCameraPosition: _myPosition,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){

          getCurrentLocation().then((value)async{
            print('My Current location');
            print(value.latitude.toString()+" "+value.longitude.toString());

            _markers.add(
              Marker(
                markerId: MarkerId('2'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(
                  title: 'My Current Location '
                )
                )
            );
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),zoom: 14);

              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {
                
              });

          });
        },
        child: Icon(Icons.local_activity),),
    );
  }
}