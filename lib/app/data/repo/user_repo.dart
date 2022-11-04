import 'package:get/get.dart';
import 'package:waste_manager/app/data/api_client/api_client.dart';
import 'package:waste_manager/app/data/api_client/api_urls.dart';

import '../../models/user_model/user_model.dart';

class UserRepo extends GetxService{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  postUserInfo(UserModel userModel) async {
    return await apiClient.postData(AppConstant.userRegister, userModel.toJson());
  }

  getUserInfo(String uid) async {
    return await apiClient.getData(uid);
  }
}