import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GarbageCollectorMarkers extends StatelessWidget {
  const GarbageCollectorMarkers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height/0.2,
        child: const GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(51.5072, 0.1276),
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
