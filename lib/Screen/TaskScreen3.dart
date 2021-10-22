// ignore_for_file: file_names



import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';

class TaskScreen3 extends StatefulWidget {
  const TaskScreen3({Key? key}) : super(key: key);

  @override
  _TaskScreen3State createState() => _TaskScreen3State();
}

class _TaskScreen3State extends State<TaskScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title3"),
      ),
       bottomNavigationBar:BottomNavigationBar( items:  const <BottomNavigationBarItem>[
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
      body: Column(
        children: const [
           TaskWidget(taskName :"flutter", subTask: "08:00-09:00 Am"),  TaskWidget(taskName :"flutter ep2", subTask: "10:00-12:00 Am"),  ],
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
final String taskName ;
final String subTask ;
final int id;
  const TaskWidget({
    Key? key,this.taskName ="" , this.subTask ="" , this.id =0
  }) : super(key: key);

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
                  children:  [
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
                onPressed: () {},
              ),
            ),
            const Text(""),
          ],
        ),
      ),
    );
  }
}




final List<TaskModel> _listTaskModel = [
TaskModel(task :"flutter", subTask:"12.00-13.00 PM", id:1),
TaskModel(task :"flutter-ep2", subTask:"13.00-13.00 PM", id:2),
TaskModel(task :"flutter-ep3", subTask:"16.00-13.00 PM", id:3)

];



