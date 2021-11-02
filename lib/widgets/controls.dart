import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telework_v2/Class/route.dart';
import 'package:telework_v2/Models/templateList.dart';
import 'package:telework_v2/Screen/mainMenu.dart';

class IconText extends StatelessWidget {
  IconText(
      {Key? key,
      required this.icon,
      required this.hintTxt,
      required this.textEdiltController,
      required this.labelText})
      : super(key: key);
  final String hintTxt;
  final IconData icon;
  final TextEditingController textEdiltController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return
        //Container(
        // child:
        Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Colors.white,

          controller: textEdiltController,
          decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
              fillColor: Colors.white,
              filled: true,
              labelText: labelText, //hintTextDirection: hintTxt,
              icon: Icon(
                icon,
                color: Colors.blue,
              )),
          // ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainMenuScreen()));
            },
            child: Text(buttonText),
          )
        ]),
      ),
    );
    // ],
    //  )
    // );
  }
}

class GridManu extends StatelessWidget {
  const GridManu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children:  <Widget>[
        CardButton(
          text: "Task record",
          route: MyRoute.myTask,
        ),
        CardButton(
          text: "Master template",
          route: MyRoute.templateList,
        ),
        CardButton(
          text: "Master",
          route: MyRoute.master,
        ),
        ElevatedButton(onPressed: () { MasterTemplateList.list.clear();}, child: Text("Clear master template"))
        // onPressed: () {

        // },
        // child: Text("clear list mastervtemplate");)
        //   CardButton(
        //   text: "Template",
        //   route: MyRoute.template,
        // ),
        //   CardButton(
        //   text: "Template",
        //   route: MyRoute.template,
        // ),
      ],
    ));
  }
}

class CardButton extends StatelessWidget {
  const CardButton({Key? key, required this.text, required this.route})
      : super(key: key);
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: const EdgeInsets.all(8),
        //  padding: const EdgeInsets.all(8),
        child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
        //    MaterialPageRoute(builder: (context) => const MainMenu()));
      },
      child: Card( color: Colors.blue,
          child: Container(
        alignment: Alignment.center,
        child: Text(text),
      )),
    ));
  }
}
