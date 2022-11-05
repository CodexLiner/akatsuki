
import 'dart:developer';

import 'package:get/get.dart';

import '../../models/google_marker_model/google_marker_model.dart';
import '../repo/google_marker_repo.dart';

class GoogleMarkerController extends GetxController {
  final GoogleMarkerRepo googleMarkerRepo;
  GoogleMarkerController({required this.googleMarkerRepo});

  List<GoogleMarkerModel> googleMarkers= [];

  Future<void> getAllMarkers() async {
    var response = await googleMarkerRepo.getAllMarkers();
    var markers = response.body;
    googleMarkers = [];
    markers.forEach((marker) => {
      googleMarkers.add(GoogleMarkerModel.fromJson(marker))
    });
    update();
  }

  Future<void> putMarker(GoogleMarkerModel googleMarkerModel) async {
    var response = await googleMarkerRepo.putMarkers(googleMarkerModel);
    update();
  }

}