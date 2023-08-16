import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsHomeScren extends StatefulWidget {
  const MapsHomeScren({super.key});

  @override
  State<MapsHomeScren> createState() => _MapsHomeScrenState();
}

class _MapsHomeScrenState extends State<MapsHomeScren> {
  late GoogleMapController  mapController ;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller){
     mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Maps Home Screen'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 14)),
    );
  }
}