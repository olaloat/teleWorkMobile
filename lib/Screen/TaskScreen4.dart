// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';

class TaskScreen4 extends StatefulWidget {
  const TaskScreen4({Key? key}) : super(key: key);

  @override
  _TaskScreen4State createState() => _TaskScreen4State();
}

class _TaskScreen4State extends State<TaskScreen4> {
  String add = "";
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("title4"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
//==================================  on press ================

                // indexx += 1;
                // TaskModel newTask = TaskModel(
                //     task: "flutter-ep3" + indexx.toString(),
                //     subTask: "16.00-13.00 PM",
                //     id: 3);
                // setState(() {
                //   _listTaskModel.add(newTask);
                // });
//==================================  on press ================
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
//==================================  on press ================

                // indexx += 1;
                // TaskModel newTask = TaskModel(
                //     task: "flutter-ep3" + indexx.toString(),
                //     subTask: "16.00-13.00 PM",
                //     id: 3);
                // setState(() {
                //   _listTaskModel.add(newTask);
                // });
//==================================  on press ================
              },
            ),
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
            Row(
              children: [
                //===================================  Blog  Plan===========================
     //  ListView(children:<Widget> [Container() , Container()],),

                //===================================  Blog  Plan===========================

                //====================================Blog actual ============================
                // Container(
                //   child: Column(
                //     children: [Text("input plan"), Text("input actualccccc")],
                //   ),
                // )

                //====================================Blog actual ============================
              ],
            )
          ],
        ));
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue,
                child: const Text(
                  "Join",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print(this.id.toString());
                },
              ),
            ),
            const Text(""),
          ],
        ),
      ),
    );
  }
}

// final List<TaskModel> _listTaskModel = [
//   TaskModel(task: "flutter", subTask: "12.00-13.00 PM", id: 1),
//   TaskModel(task: "flutter-ep2", subTask: "13.00-13.00 PM", id: 2),
//   TaskModel(task: "flutter-ep3", subTask: "16.00-13.00 PM", id: 3)
// ];
