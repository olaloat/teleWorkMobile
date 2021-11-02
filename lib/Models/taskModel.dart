// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String workTask;
  final String workSubTask;
  final String workType;
  final String type;
  TimeOfDay timeStart = TimeOfDay.now();
  TimeOfDay timeEnd = TimeOfDay.now();
//  final Image imageTask;
  String imagePath;

  TaskModel({
    required this.workType,
    required this.workTask,
    required this.workSubTask,
    required this.id,
    required this.type,
    this.imagePath = "assets/images/1.PNG",
    required this.timeStart,
    required this.timeEnd,
    
    Key? key, //String subTask
  });
}

class MyTaskList {
  static final List<TaskModel> myList = [
    TaskModel(
      id: 0,
      type: "00000",
      workTask: "task 0000 ",
      workSubTask: "lllllll",
      workType: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now(),
    )
  ];
}
