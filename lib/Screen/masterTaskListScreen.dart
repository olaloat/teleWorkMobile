// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Models/masterModel.dart';
import 'package:telework_v2/Models/templateList.dart';

class MasterTaskListScreen extends StatefulWidget {
  const MasterTaskListScreen({Key? key}) : super(key: key);

  @override
  _MasterTaskListScreenState createState() => _MasterTaskListScreenState();
}

class _MasterTaskListScreenState extends State<MasterTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    //  List<MasterTemplate> listMaster = [];
    //  myMasterTemplate: MasterTemplateList.list[i])
    // setState(() {
    //   listMaster = MasterTemplateList.list;
    // });
    return Scaffold(
        appBar: AppBar(
          title: const Text("Master Task"),
        ),
        body: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 2),
                itemCount: MasterTask.list.length,
                itemBuilder: (BuildContext context, int i) {
                  return CardMasterTemplate(
                      myMasterTemplate: MasterTask.list![i]);
                } // item builder
                ), // silver grid delegate
          ),
        )); // scaffold
  }
}

class CardMasterTemplate extends StatelessWidget {
  const CardMasterTemplate({
    required this.myMasterTemplate,
    Key? key,
  }) : super(key: key);
  final TaskModel myMasterTemplate;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: IntrinsicHeight(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.cyan[100],
                  child: Container(width: double.infinity, height: 10 //* (2/3),
                      ),
                ),
                Text(
                  myMasterTemplate.workType,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
                Text(
                  myMasterTemplate.workTask,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
                Text(myMasterTemplate.workSubTask,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]))
              ]),
        ),
      ),
    ));
  }
}
