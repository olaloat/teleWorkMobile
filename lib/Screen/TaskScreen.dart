// ignore: file_names
// ignore_for_file: file_names


import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({ Key? key }) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  final String pTitel  ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(pTitel),),
    body: ListView (children: <Widget>[

 Container(
      height: 50,
      color: Colors.amber[600],
             child: const Center(child: Text('Entry')),),







              Card(
                
          color: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          
          elevation: 8,
          child:  Row(
             mainAxisSize: MainAxisSize.min,
            children: const [
            
            Center(child: Text("column1") )  ,
            
            Center(child: Text("column1"))
            
            
            ],),
        ),


    ],
    
    ),
      


      






    );
  }
}

