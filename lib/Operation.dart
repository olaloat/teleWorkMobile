// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Screen/MyTask.dart';

import 'Screen/TaskEditScreen.dart';

class Operation {
  static void navigateScreenTaskEdit(BuildContext context , TaskModel passData) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  TaskEditScreen(passData: passData )),
    );
  }

    static void navigateScreenMyTask(BuildContext context ) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyTask()),
    );
  }
}