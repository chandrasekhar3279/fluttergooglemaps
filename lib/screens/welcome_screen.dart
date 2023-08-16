import 'package:flutter/material.dart';
import 'package:googlemaps/maps/cloudseed_technologies.dart';
import 'package:googlemaps/maps/home_screen.dart';
import 'package:googlemaps/maps/pincode_locations.dart';
import 'package:googlemaps/maps/pinconde_confirm.dart';
import 'package:googlemaps/maps/tracking_location.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        elevation: 2,
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MapsHomeScren(),
                ),
              );
            },
            child: const Text('Go to Maps'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CloudseedTechnologiesPage(),
                ),
              );
            },
            child: const Text('Cloudseed Technologies'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PincodeConfirmWidget(),
                ),
              );
            },
            child: const Text('Marked Locations list'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrackingLocation(),
                ),
              );
            },
            child: const Text('Tracking location'),
          ),
        ]),
      ),
    );
  }
}
