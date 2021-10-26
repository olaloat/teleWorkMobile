// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:intl/intl.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({Key? key}) : super(key: key);

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  String add = "";
  int indexx = 0;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTimeStart = TimeOfDay.now();
  TimeOfDay selectedTimeEnd = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateStart = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();

  String timeString = "";

  final TextEditingController textInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New event"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.check)),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                //===========================input Text====================

                Container(
                  child: const TextField(
                    decoration: InputDecoration(
                        labelText: "Type", icon: Icon(Icons.edit)),
                  ),
                ),
                //===========================input Text====================

                const Divider(color: Colors.black),

                //=========================  block  select time =========================
                Row(
                  children: [
                    //================================  icon clock =======================
                    Container(
                      child: const Icon(Icons.access_alarm),
                      width: 60,
                    ),

                    //================================  icon clock =======================

                    //========================  block  All day =====================================================
                    Container(
                        width: 320,
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text("All Day"),
                                      // color: Colors.pink,
                                    ),
                                  ),
                                  Container(
                                    child: Text("check"),
                                    //color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.black),
                            //========================  block  All day =====================================================

                            //========================  block  Start =====================================================
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                       child: InkWell(
                                      onTap: () {
                                        _selectDate(context, "start");
                                        // Navigator.pushNamed(context, "write your route");โ
                                      },
                                      child: new Text(
                                          DateFormat('yyyy-MM-dd')
                                              .format(selectedDateStart)),
                                    ),
                                      // color: Colors.pink,
                                    ),
                                  ),
                                  Container(
                                    child:
                                        //Text("5:00 PM"),

                                        InkWell(
                                      onTap: () {
                                        _selectTime(context, "start");
                                        // Navigator.pushNamed(context, "write your route");โ
                                      },
                                      child: new Text(
                                          formatTimeOfDay(selectedTimeStart)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.black),
                            //========================  block  Start =====================================================

                            //========================  block  end =====================================================
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _selectDate(context, "end");
                                        // Navigator.pushNamed(context, "write your route");โ
                                      },
                                      child: new Text(
                                          DateFormat('yyyy-MM-dd')
                                              .format(selectedDateEnd)),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        _selectTime(context, "end");
                                        // Navigator.pushNamed(context, "write your route");โ
                                      },
                                      child: new Text(
                                          formatTimeOfDay(selectedTimeEnd)),
                                    ),
                                    //color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.black),
                            //========================  block  end =====================================================
                          ],
                        )),
                  ],
                ),
              ],
            )

//Row(children: [Text(" ") , Text("detail")],)
          ],
        ));
  }

  _selectTime(BuildContext context, String timeType) async {
    if (timeType == "start") {
      selectedTime = selectedTimeStart;
    } else {
      selectedTime = selectedTimeEnd;
    }

    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        if (timeType == "start") {
          selectedTimeStart = timeOfDay;
        } else {
          selectedTimeEnd = timeOfDay;
        }
      });
    }
  }

  _selectDate(BuildContext context, String dateType) async {
    if (dateType == "start") {
      selectedDate = selectedDateStart;
    } else {
      selectedDate = selectedDateEnd;
    }

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        if (dateType == "start") {
          selectedDateStart = selected;
        } else {
          selectedDateEnd = selected;
        }

        //  selectedDate = selected;
      });
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
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
