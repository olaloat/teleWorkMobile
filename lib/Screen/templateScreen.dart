// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Class/Util.dart';
import 'package:telework_v2/Models/TaskModel.dart';
import 'package:telework_v2/widgets/dialog.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  late List<TaskModel> myTasklist = [];
  SimpleDialog dialogSaveTempalteName = SimpleDialog(
    title: Text('Save your template'),
    children: [//Text("data") , 
    DialogSave()],
  );

  // _TemplateScreenState(this.myTasklist);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    for (int i = 0; i <= 10; i++) {
      myTasklist.add(TaskModel(
          workType: "type$i",
          workTask: "workTask",
          workSubTask: "workSubTask",
          id: i,
          type: "type",
          timeStart: TimeOfDay.now(),
          timeEnd: TimeOfDay.now()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // String sss ="";
    return Scaffold(
      appBar: AppBar(
        title: Text("Create template"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog<void>(
                  context: context,
                  builder: (context) => dialogSaveTempalteName);
              // MaterialPageRoute(builder: (context) => const DialogSave());
            },
          )
        ],
        //Text("Template"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: myTasklist.length,
        itemBuilder: (BuildContext context, 
        int index) {
          return TaskCard(myTask: myTasklist[index]);

          //  TaskCard(MyTaskScreen: MyTaskList.myList[index]);
        },
      ),

      // ListView(
      //   children: [
      //     TaskCard(
      //         myTask: TaskModel(
      //             workType: "xxxx",
      //             workTask: "yyyy",
      //             workSubTask: "zzzz",
      //             id: 0,
      //             type: "ttttt",
      //             timeStart: TimeOfDay.now(),
      //             timeEnd: TimeOfDay.now())),
      //             TaskCard(
      //         myTask: TaskModel(
      //             workType: "xxxx",
      //             workTask: "yyyy",
      //             workSubTask: "zzzz",
      //             id: 0,
      //             type: "ttttt",
      //             timeStart: TimeOfDay.now(),
      //             timeEnd: TimeOfDay.now()))
      //   ],
      // )
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.myTask}) : super(key: key);
  final TaskModel myTask;
// final String task ;
// final String subTask ;
// final TimeOfDay time ;
  @override
  Widget build(BuildContext context) {
    //String  workTask =myTask.workType ?? "";
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Card(
          //color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                    child: Container(
                  child: const Icon(
                    Icons.task,
                    size: 40,
                  ),
                )),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithLable(
                          labelText: "Type :",
                          text: myTask.workType,
                          color: Colors.black,
                        ),
                        TextWithLable(
                          labelText: "Task :",
                          text: myTask.workTask,
                          color: Colors.black,
                        ),
                        TextWithLable(
                          labelText: "Sub task :",
                          text: myTask.workSubTask,
                        ),
                        // Row(children: [Text("data") , Text("data")],)
                        TextTimeRange(
                          timeStart: myTask.timeStart,
                          timeEnd: myTask.timeEnd,
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Edit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextTimeRange extends StatelessWidget {
  const TextTimeRange(
      {Key? key, required this.timeStart, required this.timeEnd})
      : super(key: key);

  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(Util.formatTimeOfDay(timeStart)),
        Text("-"),
        Text(Util.formatTimeOfDay(timeEnd))
      ],
    );
  }
}

class TextWithLable extends StatelessWidget {
  const TextWithLable(
      {Key? key,
      required this.labelText,
      required this.text,
      this.color = Colors.grey})
      : super(key: key);
  final String labelText;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelText,
          style: TextStyle(color: color),
        ),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
