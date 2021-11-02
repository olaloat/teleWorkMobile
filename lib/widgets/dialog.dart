//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:telework_v2/Class/route.dart';
import 'package:telework_v2/Models/templateList.dart';
import 'package:telework_v2/Screen/templateListScreen.dart';

class DialogSave extends StatefulWidget {
  const DialogSave({Key? key}) : super(key: key);

  @override
  _DialogSaveState createState() => _DialogSaveState();
}

class _DialogSaveState extends State<DialogSave> {
  final TextEditingController textNameController = TextEditingController();
    final TextEditingController textDetailController = TextEditingController();
  
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Template Name:"),
            TextField(
              controller: textNameController,
              decoration: InputDecoration(
                labelText: "Please enter template name.",
              ),
            ),
            TextField(controller: textDetailController,decoration: InputDecoration(labelText: "Detail"),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child:
                        ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
                  ),

                  //=====================  button save =====================================//
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            MasterTemplateList.list.add(MasterTemplate(
                                templateName: textNameController.text.toString(),
                                id:  MasterTemplateList.list.length,
                                detail: textDetailController.text.toString()));
                          });
                          Navigator.popAndPushNamed(
                            context,
                            MyRoute.templateList,
                          );

                          // Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //       builder: (context) => new TemplateListScreen()),
                          // );
                        },
                        child: const Text("SAVE")),
                  )
                  //=====================  button save =====================================//
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
