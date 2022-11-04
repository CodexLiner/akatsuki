import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCollectionDialogBox extends StatefulWidget {
  final Function(String, String) newCollectionData;
  const NewCollectionDialogBox({Key? key,required this.newCollectionData}) : super(key: key);

  @override
  State<NewCollectionDialogBox> createState() => _NewCollectionDialogBoxState();
}

class _NewCollectionDialogBoxState extends State<NewCollectionDialogBox> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/1.4,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Add your Collection",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter your title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Enter your description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){
                    widget.newCollectionData(
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add"),

              )
            ],
          ),
        ),
      ),
    );
  }
}
