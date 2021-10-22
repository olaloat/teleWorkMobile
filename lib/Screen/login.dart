import 'package:flutter/material.dart';
import 'package:telework_v2/Screen/menu.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

// 2.   ส่ง class นี้ขึ้นไป build ใส่ ข้างบน==============

class _loginScreenState extends State<loginScreen> {
  String textResult = "resut";
  @override
  Widget build(BuildContext context) {
    final TextEditingController textInput = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            "Login Screen",
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        ),
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              TextBox(
                textInput: textInput,
                lbTxt: "Username",
                icon: Icons.person,
                hintTxt: "Please input your username.",
              ),

              TextBox(
                textInput: textInput,
                lbTxt: "Password",
                icon: Icons.lock,
                hintTxt: "Please input your password...",
              ),

              Text(
                textResult,
              ),

              const Cbt(btTxt: "Login"),

              ElevatedButton(
                  onPressed: () {
                    //  setState(() {
                    //    textResult=textInput.text;
                    //  });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()),
                    );
                  },
                  child: const Text("Go to menu"))
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
  const Cbt({Key? key, this.btTxt = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
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
