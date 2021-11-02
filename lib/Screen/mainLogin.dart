// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:telework_v2/Screen/login.dart';
import 'package:telework_v2/widgets/controls.dart';

class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  _MainLoginScreenState createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  final TextEditingController textusernameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tele work" ,),
        //  backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
         // color: Colors.red,
          child: Column(
            children: [
                  Text(
                "Sign In",style: TextStyle(fontSize: 30 , color: Colors.grey[600]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to Telework",style: TextStyle(fontSize: 20 , color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              // Space(),
              IconText(
                  icon: Icons.person,
                  hintTxt: "hintTxt",
                  textEdiltController: textusernameController,
                  labelText: ""),

              //const Space(),
              IconText(
                  icon: Icons.lock,
                  hintTxt: "hintTxt",
                  textEdiltController: textPasswordController,
                  labelText: ""),
              // Space(),
              Row( 
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 12),
                      primary: Colors.blue,
                    ),
                    onPressed: () {},
                    child: const Text('Forgot Password'),
                  ),
                ],
              ),

              //  Space(),
              const SubmitButton(
                buttonText: "Login",
              ),
              // Container(child: button,)
            ],
          ),
        ),
      ),
    );
  }
}

class TexBox extends StatelessWidget {
  const TexBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [Text("Username"), Text("textbox Username")]));
  }
}

class Space extends StatelessWidget {
  const Space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
    );
  }
}

//  Container( child:Scaffold(appBar: (title:Text("App bar")) , body: ,)
//       child:  Scaffold (//appBar: , 
//       body:Column(children: [
//       Text("Header"),
//       Text("SubHeader"),
//       Row(
//       children: [Text("login"), Text("textBoxUsername")],
//       )
//     ])));
