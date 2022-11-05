
import 'dart:developer';

import 'package:get/get.dart';
import 'package:waste_manager/app/data/api_client/api_client.dart';
import 'package:waste_manager/app/data/api_client/api_urls.dart';

import '../../models/general_collection_model/general_collection_model.dart';

class GeneralCollectionRepo extends GetxService{
  final ApiClient apiClient;
  GeneralCollectionRepo({required this.apiClient});

  postUserCollection(GeneralCollection generalCollection) async {
    return await apiClient.postData(AppConstant.uploadCollection,generalCollection.toJson());
  }

  getAllCollection()async{
    return await apiClient.getData(AppConstant.generalCollection);
  }

  editCollection(GeneralCollection generalCollection) async {
    log("${AppConstant.updateCollection}/${generalCollection.title}");
    return await apiClient.putData("${AppConstant.updateCollection}/${generalCollection.title}",generalCollection.toJson());
  }
}