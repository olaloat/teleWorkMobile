// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:intl/intl.dart';

class TaskScreen5 extends StatefulWidget {
  const TaskScreen5({Key? key}) : super(key: key);

  @override
  _TaskScreen5State createState() => _TaskScreen5State();
}

class _TaskScreen5State extends State<TaskScreen5> {
  String add = "";
  int indexx = 0;
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController textInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("title5"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
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
            ),
            IconButton(
              icon: const Icon(Icons.add),
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
            TextFeildWG(
              textInput: textInput,
              feildType: "Type",
              labelTxt: "Type",
            ),
            TextFeildWG(
              textInput: textInput,
              feildType: "Task",
              labelTxt: "Task",
            ),
            TextFeildWG(
              textInput: textInput,
              feildType: "subTask",
              labelTxt: "Sub Task",
            ),

            Row(
              //************* */ block start time picker *****************//
              children: [
                 Text("Start time :"),
                //Text(DateFormat('yyyy-MM-dd – kk:mm').format(selectedTime)),
           
                //============  button date picker start ===================//
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: Text("Choose Time"),
                ),
              ],
            ),
            //  TimePickerDialog(initialTime: "Time Start")
          ],
        ));
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

class TextFeildWG extends StatelessWidget {
  const TextFeildWG({
    Key? key,
    required this.textInput,
    required this.feildType,
    required this.labelTxt,
  }) : super(key: key);

  final TextEditingController textInput;
  final String feildType;
  final String labelTxt;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      controller: textInput,
      decoration: InputDecoration(
        labelText: labelTxt,
        hintText: "",
        icon: Icon(
          Icons.task,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class testWidget extends StatelessWidget {
  final String xxx;
  const testWidget({Key? key, this.xxx = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(xxx),
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
                  //  print(this.id.toString());
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

final List<TaskModel> _listTaskModel = [
  TaskModel(task: "flutter", subTask: "12.00-13.00 PM", id: 1),
  TaskModel(task: "flutter-ep2", subTask: "13.00-13.00 PM", id: 2),
  TaskModel(task: "flutter-ep3", subTask: "16.00-13.00 PM", id: 3)
];
