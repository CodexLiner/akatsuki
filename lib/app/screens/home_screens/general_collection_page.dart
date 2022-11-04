import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:waste_manager/app/data/controllers/general_collection_controller.dart';
import 'package:waste_manager/app/data/controllers/user_controller.dart';
import 'package:waste_manager/app/models/description_model/description_model.dart';
import 'package:waste_manager/app/models/general_collection_model/general_collection_model.dart';
import 'package:waste_manager/app/screens/home_screens/widgets/existingCollectionDialogBox.dart';
import 'package:waste_manager/app/screens/home_screens/widgets/newCollectionDialogBox.dart';

import '../../models/user_model/user_model.dart';

class GeneralCollectionPage extends StatefulWidget {
  const GeneralCollectionPage({Key? key}) : super(key: key);

  @override
  State<GeneralCollectionPage> createState() => _GeneralCollectionPageState();
}

class _GeneralCollectionPageState extends State<GeneralCollectionPage> {

  late String username;
  List<String> titleList = [];

  loadData () async {
    await Get.find<GeneralCollectionController>()
        .getAllCollection();
    UserModel? user = await Get.find<UserController>().getUserInfo(FirebaseAuth.instance.currentUser!.uid);
    username = user!.username;
  }

  @override
  void initState() {
    Get.find<GeneralCollectionController>();
    // loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<GeneralCollectionController>(
      builder:  (generalController){

        generalController.generalCollection.forEach((element) {
          titleList.add(element.title);
        });

        return Scaffold(
          body: ListView.builder(
            // itemCount: generalController.generalCollection.length,
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index){

              // final descriptionModelList = generalController.generalCollection[index].descriptionModel;
              return Container(
                margin: const EdgeInsets.symmetric( vertical: 10, horizontal: 15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric( vertical: 20, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.blue[300]
                      ),
                      child: const Text(
                        // generalController.generalCollection[index].title,
                        "This is the title",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.blue[200]
                        ),
                        child: ListView.builder(
                          // itemCount: descriptionModelList.length,
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  height: 8,
                                  width: 8,
                                  margin: EdgeInsets.only(right: 15, top: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    // "${descriptionModelList[index].description} (by ${descriptionModelList[index].username})",
                                    "This is the description and oagbeuob ik sgeif sise fi fai sifa igef sj sfj bdsj iv sjhc vjh vinsd vkaj j hjv ao jksocf aj ocj ks ik aej i",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                    ),
                  ],
                ),
              );
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (){},
          //   child: Icon(Icons.add),
          // ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.new_label),
                  label: "Create New",
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return NewCollectionDialogBox(
                              newCollectionData: (title, description) {
                                generalController.postCollection(
                                    GeneralCollection(
                                        title: title,
                                        descriptionModel: [
                                          DescriptionModel(
                                            username: username,
                                            dateTime: DateTime.now(),
                                            description: description,
                                          ),
                                        ]
                                    )
                                );
                                loadData();
                              }
                          );
                        });
                  }
              ),
              SpeedDialChild(
                  child: Icon(Icons.add_card),
                  label: "Add existing",
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ExistingCollectionDialogBox(
                            titleList: titleList,
                            existingCollectionData: (title, description) {
                              generalController.editCollection(
                                  GeneralCollection(
                                      title: title,
                                      descriptionModel: [
                                        DescriptionModel(
                                          username: username,
                                          dateTime: DateTime.now(),
                                          description: description,
                                        ),
                                      ]
                                  )
                              );
                              loadData();
                            }
                          );
                        });
                  }
              )
            ],
          ),
        );
      },
    );
  }
}
