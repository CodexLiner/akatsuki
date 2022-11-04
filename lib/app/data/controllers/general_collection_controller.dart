
import 'package:get/get.dart';
import 'package:waste_manager/app/models/general_collection_model/general_collection_model.dart';

import '../repo/general_collection_repo.dart';

class GeneralCollectionController extends GetxController{
  final GeneralCollectionRepo generalCollectionRepo;
  GeneralCollectionController({required this.generalCollectionRepo});


  List<GeneralCollection> generalCollection = [];

  Future<void> postCollection(GeneralCollection generalCollection) async {
    await generalCollectionRepo.postUserCollection(generalCollection);
  }

  Future<void> getAllCollection() async {
    var response = await generalCollectionRepo.getAllCollection();
    if(response.statusCode==200){
      generalCollection = [];
      response.forEach((element) => {
        generalCollection.add(GeneralCollection.fromJson(element))
      });
      update();
    }
  }

  void editCollection(GeneralCollection generalCollection) async {
    await generalCollectionRepo.editCollection(generalCollection);
  }
}