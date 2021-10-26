// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';

class TaskScreen6 extends StatefulWidget {
  const TaskScreen6({Key? key}) : super(key: key);

  @override
  _TaskScreen6State createState() => _TaskScreen6State();
}

class _TaskScreen6State extends State<TaskScreen6> {
  String add = "";
  int indexx = 0;

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

                indexx += 1;
                TaskModel newTask = TaskModel(
                    task: "flutter-ep3" + indexx.toString(),
                    subTask: "16.00-13.00 PM",
                    id: 3);
                setState(() {
                  _listTaskModel.add(newTask);
                });
//==================================  on press ================
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Profile',
            ),
          ],
          currentIndex: 1,
          // onTap: _onItemTapped,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child:TaskWidget(id: 0 , taskName: "task1" , subTask: "subtask",),
                        color: Colors.red,
                      ),
                    ),
                     Expanded(
                      child: Container(
                        child:TaskWidget(id: 0 , taskName: "task1" , subTask: "subtask",),
                        color: Colors.red,
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
}

class TaskWidget extends StatelessWidget {
  final String taskName;
  final String subTask;
  final int id;
  const TaskWidget(
      {Key? key, this.taskName = "", this.subTask = "", this.id = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(onTap: (){},
        child: Card( 
          color: Colors.yellow,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 5,
                  color: Colors.red,
                  child: Text(""),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskName),
                  Row(
                    children: [
                      Text(subTask),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.access_time_filled),
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
  TaskModel(task: "flutter", subTask: "12.00-13.00 PM", id: 1),
  TaskModel(task: "flutter-ep2", subTask: "13.00-13.00 PM", id: 2),
  TaskModel(task: "flutter-ep3", subTask: "16.00-13.00 PM", id: 3)
];
