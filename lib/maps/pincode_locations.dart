import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemaps/models/area.dart';
import 'package:http/http.dart' as http;

class LocationsPincodePostal extends StatefulWidget {
  const LocationsPincodePostal({required this.pincode, super.key});
  final String pincode;

  @override
  State<LocationsPincodePostal> createState() => _LocationsPincodePostalState();
}

class _LocationsPincodePostalState extends State<LocationsPincodePostal> {
  // late GoogleMapController mapController;
  List<Area> _areas = [];
  // final LatLng _pincode =  ;
  final Completer<GoogleMapController> _mapController = Completer();
  String _pin = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _pin = widget.pincode;
    getAllLocations();
  }

  void getAllLocations() async {
    var headers = {
      'X-RapidAPI-Key': '45c7a43618msh215539d1eafea63p10263djsn1d37a5c2c1ed',
      'X-RapidAPI-Host':
          'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
    };
    final path =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$_pin";

    final response = await http.get(Uri.parse(path), headers: headers);
    final List<dynamic> resBody = jsonDecode(response.body);
    final List<Area> loadedAreas = [];
  
    for (final area in resBody) {
      loadedAreas.add(
        Area(
          pincode: area['pincode'],
          area: area['area'],
          lat: area['lat'],
          lng: area['lng'],
          district: area['district'],
          state: area['state'],
        ),
      );
    }
    setState(() {
      _areas = loadedAreas;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: CircularProgressIndicator());
    if(_areas.isEmpty && isLoading == false){
      content = const Center(child: Text('No Areas found,Check Your Pincode'),);
    }

    if(_areas.isNotEmpty && isLoading == false) {
      content = Column(
        children: [
          Flexible(
            flex: 2,
            child: GoogleMap(
              // markers: Set(Marker(markerId: )),
              initialCameraPosition: CameraPosition(target: LatLng(_areas[0].lat, _areas[0].lng), zoom: 12),
              markers: _areas
                  .map(
                    (item) => Marker(
                      markerId: MarkerId(item.area),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(item.lat, item.lng),
                      infoWindow:
                          InfoWindow(title: item.area, snippet: item.state),
                    ),
                  )
                  .toSet(),
              onMapCreated: (mapController) {
                _mapController.complete(mapController);
              },
            ),
          ),
          Flexible(
            flex: 4,
            child: ListView.builder(
              itemCount: _areas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: double.maxFinite,
                    color: Color.fromARGB(255, 199, 222, 174),
                    child: Column(
                      children: [
                        Text(_areas[index].area,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          _areas[index].district,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final controller = await _mapController.future;
                            await controller.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(
                                      _areas[index].lat,
                                      _areas[index].lng,
                                    ),
                                    zoom: 16),
                              ),
                            );
                          },
                          child: const Text("Get Mylocation"),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Postal Pincodes ${widget.pincode}'),
      ),
      body: content
    );
  }
}
