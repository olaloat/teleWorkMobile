// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Class/Util.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Operation.dart';
import 'package:telework_v2/Screen/TaskEditScreen.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  String add = "";
  int indexx = 0;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Task"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
//==================================  on press ================
              Operation.navigateScreenTaskEdit(context);

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

//                IconButton(
//               icon: Icon(Icons.refresh),
//               onPressed: () {
// //==================================  on press ================

// //==================================  on press ================
//               },
//             )
        ],
      ),
      body:
          // ListView(
          //   children: [
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             Expanded(
          //               child: Container(
          //                 child: TaskWidget(
          //                   id: 0,
          //                   typeName: "Implement",
          //                   taskName: "Project",
          //                   subTask: "migrate server",
          //                 ),
          //                // color: Colors.red,
          //               ),
          //             ),
          //             Expanded(
          //               child: Container(
          //                 child: TaskWidget(
          //                   id: 0,
          //                   typeName: "Implement",
          //                   taskName: "Project",
          //                   subTask: "migrate server",
          //                 ),
          //              //   color: Colors.red,
          //               ),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Text("C 2"),
          //           ],
          //         )
          //       ],
          //     )
          //   ],
          // )

          ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: MyTaskList.myList.length,
        // itemBuilder: (BuildContext context, int index) {
        //   return TaskWidget(
        //     typeName:MyTaskList.myList[index].type,
        //   taskName:MyTaskList.myList[index].workTask,
        //   subTask:MyTaskList.myList[index].workSubTask,
        //   id:MyTaskList.myList[index].id);
        // },

        itemBuilder: (BuildContext context, int index) {
          return TaskWidget(myTask: MyTaskList.myList[index]);
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
  // final String taskName;
  // final String subTask;
  // final int id;
  // final String typeName;

  final TaskModel myTask;

  const TaskWidget({
    Key? key,
    // this.taskName = "",
    // this.subTask = "",
    // this.id = 0,
    // this.typeName = ""

    required this.myTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Operation.navigateScreenTaskEdit(context);
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
                    "Type:" + myTask.workType,
                    style: const TextStyle(
                        fontSize: 18,
                        //  height: 2.0,
                        color: Colors.black),
                  ),
                  Text(
                    "Task:" + myTask.workTask,
                    style: const TextStyle(
                        fontSize: 16,
                        //  height: 2.0,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sub task:" + myTask.workSubTask,
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

                    "${ Util.formatTimeOfDay(myTask.timeStart)} - ${ Util.formatTimeOfDay(myTask.timeEnd)}"
                   
                    
                    
                    
                    
                    )
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
