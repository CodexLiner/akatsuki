
import 'package:get/get.dart';

import '../../models/user_model/user_model.dart';
import '../repo/user_repo.dart';

class UserController extends GetxController{
  final UserRepo userRepo;
  UserController({required this.userRepo});

  Future<void> postUserInfo(UserModel userModel) async {
    userRepo.postUserInfo(userModel);
  }

  Future<UserModel?> getUserInfo(String uid)async{
    var response = await userRepo.getUserInfo(uid);
    if(response.statusCode==200){
      return UserModel.fromJson(response);
    }
    return null;
  }
}