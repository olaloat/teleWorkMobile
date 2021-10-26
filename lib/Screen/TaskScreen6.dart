// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/Screen/TaskEditScreen.dart';

class TaskScreen6 extends StatefulWidget {
  const TaskScreen6({Key? key}) : super(key: key);

  @override
  _TaskScreen6State createState() => _TaskScreen6State();
}

class _TaskScreen6State extends State<TaskScreen6> {
  String add = "";
  int indexx = 0;
  TimeOfDay selectedTime = TimeOfDay.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title6"),
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
              icon: Icon(Icons.clear),
              onPressed: () {
//==================================  on press ================
             

//==================================  on press ================
              },
            )
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TaskWidget(
                          id: 0,
                          typeName: "Implement",
                          taskName: "Project",
                          subTask: "migrate server",
                        ),
                       // color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TaskWidget(
                          id: 0,
                          typeName: "Implement",
                          taskName: "Project",
                          subTask: "migrate server",
                        ),
                     //   color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("C 2"),
                  ],
                )
              ],
            )
          ],
        )

        //ListView.builder(
        //   scrollDirection: Axis.vertical,
        //   itemCount: _listTaskModel.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return TaskWidget(
        //       taskName: _listTaskModel[index].task,
        //       subTask: _listTaskModel[index].subTask,
        //       id: _listTaskModel[index].id,
        //     );
        //   },
        // ),
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
  final String taskName;
  final String subTask;
  final int id;
  final String typeName;
  const TaskWidget(
      {Key? key,
      this.taskName = "",
      this.subTask = "",
      this.id = 0,
      this.typeName = ""})
      : super(key: key);

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
              Container(
                width: 5,
                //  color: Colors.red,
                child: Text(""),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(  "Type:" +
                    typeName,
                    style: TextStyle(
                        fontSize: 18
                        ,
                        //  height: 2.0,
                        color: Colors.black),
                  ),
                  Text("Task:" + taskName ,  style: TextStyle(
                        fontSize: 16,
                        //  height: 2.0,
                        color: Colors.black),),
                  Row(
                    children: [
                      Text("Sub task:" +subTask ,    style: TextStyle(
                        fontSize: 12,
                        //  height: 2.0,
                        color: Colors.black),),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                       // child: Icon(Icons.access_time_filled),
                      )
                    ],
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
   TaskModel(workType: "Implement",
    workTask: "Project",
     workSubTask: "Migrate Server", 
     id: 0, 
     type: "Plan")

];

class Operation {
  static void navigateScreenTaskEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaskEditScreen()),
    );
  }
}
