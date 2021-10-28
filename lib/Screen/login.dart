import 'package:flutter/material.dart';
import 'package:telework_v2/Screen/menu.dart';
import '../singletons/GlobalAppData.dart';

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
    final TextEditingController textInputUsernameController = TextEditingController()..text="Nattawut_ja";
 final TextEditingController textInputPasswordController = TextEditingController()..text="aiap@123";
    return Scaffold(
       // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
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

              TextBox(
                textInput: textInputPasswordController,
                lbTxt: "Password",
                icon: Icons.lock,
                hintTxt: "Please input your password...",
              ),

              Text(
                textResult,
              ),

               Cbt(btTxt: "Login"  , username: textInputUsernameController.text),

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
  final String username ;
   Cbt({Key? key, this.btTxt = "" , this.username =""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {


GlobalAppData globalAppData = GlobalAppData();
 globalAppData.userName = this.username ;
//  Text('Global Data (Singleton), Name: ${globalAppData.name}'),


        },
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
