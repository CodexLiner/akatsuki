import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExistingCollectionDialogBox extends StatefulWidget {
  final Function(String, String) existingCollectionData;
  final List<String> titleList;
  const ExistingCollectionDialogBox({Key? key,required this.existingCollectionData, required this.titleList}) : super(key: key);

  @override
  State<ExistingCollectionDialogBox> createState() => _ExistingCollectionDialogBoxState();
}

class _ExistingCollectionDialogBoxState extends State<ExistingCollectionDialogBox> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedTitle;
  @override
  Widget build(BuildContext context) {
    log(widget.titleList.toString());
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
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme
                          .of(context)
                          .hintColor,
                    ),
                  ),
                  items: widget.titleList
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                      .toList(),
                  value: selectedTitle,
                  onChanged: (value) {
                    setState(() {
                      selectedTitle = value as String;
                    });
                  },
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
                  if(selectedTitle != '' && descriptionController.text.isNotEmpty){
                    widget.existingCollectionData(
                      selectedTitle!,
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
