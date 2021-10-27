// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String workTask;
  final String workSubTask;
  final String workType;
  final String type;
   TimeOfDay timeStart = TimeOfDay.now();
   TimeOfDay timeEnd= TimeOfDay.now();
 

  TaskModel({
    required this.workType,
    required this.workTask,
    required this.workSubTask,
    required this.id,
    required this.type,
    
     required this.timeStart,
    required  this.timeEnd
  });
}

class MyTaskList {
  static final List<TaskModel> myList = [
    TaskModel(
      id: 0,
      type: "1111",
      workTask: "task work ",
      workSubTask: "lllllll",
      workType: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now(),
    )
  ];
}
