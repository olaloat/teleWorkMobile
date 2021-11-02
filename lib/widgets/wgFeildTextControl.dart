// ignore: file_names
// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class Wg_FeildTextControl extends StatefulWidget {

  final String lbTxt;

  const Wg_FeildTextControl({
    
     Key? key,
  this.lbTxt=""


   }) : super(key: key);

  @override
  _Wg_FeildTextControlState createState() => _Wg_FeildTextControlState();
}

class _Wg_FeildTextControlState extends State<Wg_FeildTextControl> {



  @override
  Widget build(BuildContext context) {
    return  Container( 
      child: 
      Row (children: 
      const [
        Text("label") ,
        TextField(
          decoration:
           InputDecoration(
             labelText: "this is a textbox" ,
             icon: Icon(Icons.person,color: Colors.white,)
             ),)
       
       ],)



      
    );
  }
}