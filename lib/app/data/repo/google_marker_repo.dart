
import 'package:get/get.dart';
import 'package:waste_manager/app/data/api_client/api_client.dart';
import 'package:waste_manager/app/data/api_client/api_urls.dart';
import 'package:waste_manager/app/models/google_marker_model/google_marker_model.dart';

class GoogleMarkerRepo extends GetxService {
  final ApiClient apiClient;
  GoogleMarkerRepo({required this.apiClient});

  getAllMarkers() async {
    return await apiClient.getData(AppConstant.googleMarker);
  }

  putMarkers(GoogleMarkerModel googleMarkerModel) async {
    return await apiClient.postData(AppConstant.addGoogleMarker,googleMarkerModel.toJson());
  }

}