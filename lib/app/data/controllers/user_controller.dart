
import 'dart:developer';

import 'package:get/get.dart';

import '../../models/user_model/user_model.dart';
import '../repo/user_repo.dart';

class UserController extends GetxController{
  final UserRepo userRepo;
  UserController({required this.userRepo});

  postUserInfo(UserModel userModel) async {
    await userRepo.postUserInfo(userModel);
  }

  Future<UserModel?> getUserInfo(String uid)async{
    log(uid);
    var response = await userRepo.getUserInfo(uid);
    log(response.body.toString());
    return UserModel.fromJson(response.body);
  }
}