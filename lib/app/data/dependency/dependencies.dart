import 'package:get/get.dart';

import '../api_client/api_client.dart';
import '../api_client/api_urls.dart';
import '../controllers/general_collection_controller.dart';
import '../controllers/google_marker_controller.dart';
import '../controllers/user_controller.dart';
import '../repo/general_collection_repo.dart';
import '../repo/google_marker_repo.dart';
import '../repo/user_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstant.baseUrl));

  //repo
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => GeneralCollectionRepo(apiClient: Get.find()));
  Get.lazyPut(() => GoogleMarkerRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => GeneralCollectionController(generalCollectionRepo: Get.find()));
  Get.lazyPut(() => GoogleMarkerController(googleMarkerRepo: Get.find()));

}