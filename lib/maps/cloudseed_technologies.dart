import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CloudseedTechnologiesPage extends StatefulWidget {
  const CloudseedTechnologiesPage({super.key});

  @override
  State<CloudseedTechnologiesPage> createState() =>
      _CloudseedTechnologiesPageState();
}

class _CloudseedTechnologiesPageState extends State<CloudseedTechnologiesPage> {
  late GoogleMapController mapController;
  final LatLng _cloudseed = const LatLng(16.97816675220149, 82.24610977917436);
  
  // void _onMapCreated(GoogleMapController controller){
  //    mapController = controller;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cloudseed Technologies, Kakinada'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: GoogleMap(
                 mapType: MapType.hybrid,
                // onMapCreated: _onMapCreated,
                // zoomGesturesEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: _cloudseed, zoom: 18)),
          ),
          const Flexible(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                        
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Cloud seed Technologies',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 177, 20, 156)),
                            ),
                             Text(
                          'Kakinada',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.map_outlined,color: Colors.green,),
                            Icon(Icons.phone_android_outlined, color: Colors.amberAccent,),
                          ],
                        )
                       
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
