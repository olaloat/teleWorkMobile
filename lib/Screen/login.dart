import 'package:flutter/material.dart';
import 'package:telework_v2/Screen/MyTask.dart';
import 'package:telework_v2/Screen/mainMenu.dart';
import 'package:telework_v2/Screen/menu.dart';
import 'package:telework_v2/services/authen_service.dart';
import '../singletons/GlobalAppData.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// 2.   ส่ง class นี้ขึ้นไป build ใส่ ข้างบน==============

class _LoginScreenState extends State<LoginScreen> {
  String textResult = "resut";
  @override
  Widget build(BuildContext context) {
    final TextEditingController textInputUsernameController =
        TextEditingController()..text = "222-AIAP";
    final TextEditingController textInputPasswordController =
        TextEditingController()..text = "222-AIAP";
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text(
            "Login Screen",
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        ),
        body: Container(
          // color: Colors.red,
          child: Column(
            children: [
              TextBox(
                textInput: textInputUsernameController,
                lbTxt: "Username",
                icon: Icons.person,
                hintTxt: "Please input your username.",
              ),

              Expanded(
                child: TextBox(
                  textInput: textInputPasswordController,
                  lbTxt: "Password",
                  icon: Icons.lock,
                  hintTxt: "Please input your password...",
                ),
              ),

              const Text(""
                  // textResult,
                  // ${globalAppData.name"}
                  ),

              Cbt(
                  btTxt: "Login test",
                  username: textInputUsernameController.text,
                  password: textInputPasswordController.text),

              // ElevatedButton(
              //     onPressed: () {

              //       //  setState(() {
              //       //    textResult=textInput.text;
              //       //  });

              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const MainMenu()),
              //       );
              //     },
              //     child: const Text("Go to menu"))

              // const Cbt(btTxt: "password"),
              //    const Cbt(btTxt: "forgot password")
            ],
          ),
        ));
  }
}

class $textResult {}

class Cbt extends StatelessWidget {
  final String btTxt;
  final String username;
  final String password;
  Cbt(
      {Key? key,
      this.btTxt = "",
      required this.username,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace

    print(username);
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () async {
          //print(AuthenService.login());
          // ignore: unrelated_type_equality_checks
          if (await AuthenService.login(username, password) == true) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainMenuScreen()),
            );
          }
        },

//         onPressed: () {
//           print(username);

// // GlobalAppData globalAppData = GlobalAppData();
//           globalAppData.userName = username;

//           print('title : ${globalAppData.userName}');
// //  Text('Global Data (Singleton), Name: ${globalAppData.name}'),

//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const MainMenu()),
//           );
//         },
        child: Text(btTxt),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox(
      {Key? key,
      required this.textInput,
      required this.lbTxt,
      required this.hintTxt,
      required this.icon})
      : super(key: key);

  final TextEditingController textInput;
  final String lbTxt;
  final String hintTxt;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      controller: textInput,
      decoration: InputDecoration(
        labelText: lbTxt,
        hintText: "",
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}


