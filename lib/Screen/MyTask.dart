// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Class/Util.dart';
import 'package:telework_v2/Class/route.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Operation.dart';
import '../singletons/GlobalAppData.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({Key? key}) : super(key: key);

  @override
  _MyTaskScreenState createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
  String add = "";
  int indexx = 0;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title : ${globalAppData.userName}'),
        actions: [
          IconButton(
            icon: Icon(Icons.pages),
            onPressed: () {
//==================================  on press ================
              Operation.navigateScreenTaskEdit(
                  context,
                  TaskModel(
                      workType: "",
                      workTask: "",
                      workSubTask: "",
                      id: 0,
                      type: "",
                      timeStart: TimeOfDay.now(),
                      timeEnd: TimeOfDay.now()));

//==================================  on press ================
            },
          ),
          IconButton(
            icon: Icon(Icons.clear_rounded),
            onPressed: () {
//==================================  on press ================

              setState(() {
                MyTaskList.myList.clear();
              });

//==================================  on press ================
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
//==================================  on press ================

          Navigator.pushNamed(context, MyRoute.templateList);
//==================================  on press ================
            },
          ),
//                IconButton(
//               icon: Icon(Icons.refresh),
//               onPressed: () {
// //==================================  on press ================

// //==================================  on press ================
//               },
//             )
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: MyTaskList.myList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskWidget(MyTaskScreen: MyTaskList.myList[index]);
        },
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}

class TaskWidget extends StatelessWidget {
  final TaskModel MyTaskScreen;
  const TaskWidget({
    Key? key,
    required this.MyTaskScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          // _MyTaskScreenState editStat  =new _MyTaskScreenState();

          // Operation.navigateScreenTaskEdit(context, MyTaskScreen);
        },
        child: Card(
          color: Colors.blue[100],
          child: Row(
            children: [
              const SizedBox(
                width: 5,
                //  color: Colors.red,
                child: Text(""),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type:" + MyTaskScreen.workType,
                    style: const TextStyle(
                        fontSize: 18,
                        //  height: 2.0,
                        color: Colors.black),
                  ),
                  Text(
                    // "Task:" + MyTaskScreen.workTask,
                    'title : ${globalAppData.userName}',
                    style: const TextStyle(
                        fontSize: 16,
                        //  height: 2.0,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sub task:" + MyTaskScreen.workSubTask,
                        style: const TextStyle(
                            fontSize: 12,
                            //  height: 2.0,
                            color: Colors.black),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        // child: Icon(Icons.access_time_filled),
                      )
                    ],
                  ),

                  // time  Start - End
                  Text(
                      "${Util.formatTimeOfDay(MyTaskScreen.timeStart)} - ${Util.formatTimeOfDay(MyTaskScreen.timeEnd)}")
                ],
              )),
              const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}

final List<TaskModel> _listTaskModel = [
  TaskModel(
    workType: "Implement",
    workTask: "Project",
    workSubTask: "Migrate Server",
    id: 0,
    type: "Plan",
    timeEnd: TimeOfDay.now(),
    timeStart: TimeOfDay.now(),
  )
];
