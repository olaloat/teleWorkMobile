// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:intl/intl.dart';
import 'package:telework_v2/Models/masterModel.dart';
import 'package:telework_v2/Operation.dart';
import 'package:telework_v2/Screen/MyTask.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({Key? key, required this.passData}) : super(key: key);

  final TaskModel passData;

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
  bool isAllDay = false;
  String workType = "";
  String workTask = "";
  String workSubTask = "";
  int id = 0;
  String type = "";
  String timeString = "";

  final TextEditingController textInputType = TextEditingController();
  final TextEditingController textInputTask = TextEditingController();
  final TextEditingController textInputSubtask = TextEditingController();

  void mockUpMasterTaskList() {
      MasterTask.list.clear();
    for (int i = 0; i <= 10; i++) {
    
      MasterTask.list.add(TaskModel(
          workType: "Project${i}",
          workTask: "Implement${i}",
          workSubTask: "Migrate Server${i}",
          id: i,
          type: "Plan",
          timeStart: TimeOfDay.now(),
          timeEnd: TimeOfDay.now()));
    }
  }

  void updateTask() {
    MyTaskList.myList.add(TaskModel(
        workType: textInputType.text,
        workTask: textInputTask.text,
        workSubTask: textInputSubtask.text,
        id: MyTaskList.myList.length,
        timeEnd: selectedTimeEnd,
        timeStart: selectedTimeStart,
        type: type));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    textInputType.text = widget.passData.workType;
    textInputSubtask.text = widget.passData.workSubTask;
    textInputTask.text = widget.passData.workTask;
    selectedTimeStart = widget.passData.timeStart;
    selectedTimeEnd = widget.passData.timeEnd;
  }

  @override
  Widget build(BuildContext context) {
    mockUpMasterTaskList(); // back to fix
    return Scaffold(
      appBar: AppBar(
        title: const Text("New event"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  updateTask();
                });

                Operation.navigateScreenMyTask(context);
              },
              icon: const Icon(Icons.check)),
        ],
      ),
      body: Column(
        children: [
          Column(
            children: <Widget>[
              //=========================== type====================
              TaskInputWidget(
                      textInput: textInputType,
                      labelString: "Type",
                    )
              
              //===========================Task ====================
            , TaskInputWidget(
                      textInput: textInputTask,
                      labelString: "Task",
                    
              ),

              //===========================sub Task====================
              TaskInputWidget(
                      textInput: textInputSubtask,
                      labelString: "Sub task",
                    )
                    
              ,//=========================input type====================

              const Divider(color: Colors.black),

              //=========================  block  select time =========================
              Container(
                child: Row(
                  children: [
                    //================================  icon clock =======================
                    Container(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: const Icon(Icons.access_alarm)),
                      width: 60,
                    ),

                    //================================  block time  =======================

                
                    Container(
                        width: 320,
                        child: Column(
                          children: [

                           //========================  block  All day =====================================================
                            // Container(
                            //   height: 30,
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: Container(
                            //           child: Text("All Day"),
                            //           // color: Colors.pink,
                            //         ),
                            //       ),
                            //       Container(
                            //         child:
                            //             //Text("check"),

                            //             Switch(
                            //           //trackColor:Colors.blue,

                            //           value: isAllDay,
                            //           onChanged: (value) {
                            //             setState(() {
                            //               isAllDay = value;
                            //               print(isAllDay);
                            //             });
                            //           },
                            //           activeTrackColor: Colors.blue[200],
                            //           activeColor: Colors.blue,
                            //         ),

                            //         //color: Colors.blue,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const Divider(color: Colors.black),
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
                                        child: new Text(DateFormat('yyyy-MM-dd')
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
                                      child: new Text(DateFormat('yyyy-MM-dd')
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
              ),

              Container(
                //color: Colors.red,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: MasterTask.list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return CardMasterTask(
                            myTaskMaster: MasterTask.list[index]);
                      }),
                ),
              )
            ],
          )

//Row(children: [Text(" ") , Text("detail")],)
        ],
      ) ////    control editor

      ,
    );
  }

  setDataSelected(TaskModel selectedTask) {
    selectedTimeStart = selectedTask.timeStart;
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

class CardMasterTask extends StatelessWidget {
  const CardMasterTask({Key? key, required this.myTaskMaster})
      : super(key: key);
  final TaskModel myTaskMaster;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        child: Column(
          children: [
            const Image(
              fit: BoxFit.fill,
              height: 80,
              width: double.infinity,
              image: AssetImage("assets/images/1.PNG"),
            ),
            Text(
              myTaskMaster.workType,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              myTaskMaster.workTask,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            Text(
              myTaskMaster.workSubTask,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            )
          ],
        ),
      ),
      //Text(_listMasterTask[index].workSubTask),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
    );
  }
}

class TaskInputWidget extends StatelessWidget {
  const TaskInputWidget(
      {Key? key, required this.labelString, required this.textInput})
      : super(key: key);
  final String labelString;
  final TextEditingController textInput;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          child: TextField(
            controller: textInput,
            style: TextStyle(
                fontSize: 14,
                //  height: 2.0,
                color: Colors.black),
            decoration:
                InputDecoration(labelText: labelString, icon: Icon(Icons.edit)),
          ),
        ));
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
                child: const Text(""),
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

// class TaskMaster extends TaskModel {
//   TaskMaster() : super();

// }

final List<TaskModel> _listMasterTask = [
  TaskModel(
      workType: "Implement",
      workTask: "Project",
      workSubTask: "EPS",
      id: 0,
      type: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now()),
  TaskModel(
      workType: "Implement",
      workTask: "Project",
      workSubTask: "Po control",
      id: 0,
      type: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now()),
  TaskModel(
      workType: "Implement",
      workTask: "Project",
      workSubTask: "IBG",
      id: 0,
      type: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now()),
  TaskModel(
      workType: "Implement",
      workTask: "Project",
      workSubTask: "Migrate server",
      id: 0,
      type: "",
      timeStart: TimeOfDay.now(),
      timeEnd: TimeOfDay.now()),
];

// final List<TaskModel> _listTaskModel = [
//   TaskModel(task: "flutter", subTask: "12.00-13.00 PM", id: 1),
//   TaskModel(task: "flutter-ep2", subTask: "13.00-13.00 PM", id: 2),
//   TaskModel(task: "flutter-ep3", subTask: "16.00-13.00 PM", id: 3)
// ];
