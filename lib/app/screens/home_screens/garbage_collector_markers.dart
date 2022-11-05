import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_manager/app/data/controllers/google_marker_controller.dart';
import 'package:waste_manager/app/models/google_marker_model/google_marker_model.dart';

class GarbageCollectorMarkers extends StatefulWidget {
  const GarbageCollectorMarkers({Key? key}) : super(key: key);

  @override
  State<GarbageCollectorMarkers> createState() => _GarbageCollectorMarkersState();
}

class _GarbageCollectorMarkersState extends State<GarbageCollectorMarkers> {

  List<Marker> markerList = [];
  CameraPosition currentPosition = const CameraPosition(
    target: LatLng(51.5072, 0.1276),
    zoom: 14,
  );
  Completer<GoogleMapController> _googleMapController = Completer();

  loadMarkers() async {
    await Get.find<GoogleMarkerController>()
        .getAllMarkers();
    await getCurrentLocaton();
  }

  getCurrentLocaton() async {
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high).then((position) => {
      setState((){
        currentPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude));
      })
    });
  }

  @override
  void initState() {
    loadMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GoogleMarkerController>(
        builder: (googleControllerMarkers){

          googleControllerMarkers.googleMarkers.forEach((element) {
            markerList.add(
              Marker(
                markerId: MarkerId('1'),
                position: LatLng(element.latitude, element.longitude),
                infoWindow: InfoWindow(title: element.dateTime.toString())
              )
            );
          });

          return  Container(
            height: MediaQuery.of(context).size.height/0.2,
            child: GoogleMap(
              // onMapCreated: (googleMapController){
              //   _googleMapController = googleMapController;
              // },
              markers: Set<Marker>.of(markerList),
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: currentPosition,
              onTap: (latlng) async {
                await googleControllerMarkers.putMarker(
                  GoogleMarkerModel(
                    longitude: latlng.longitude,
                    latitude: latlng.latitude,
                    dateTime: DateTime.now(),
                    uid: FirebaseAuth.instance.currentUser!.uid,
                  )
                );
                await googleControllerMarkers.getAllMarkers();
              },
            ),
          );
        }
      ),
    );
  }
}
