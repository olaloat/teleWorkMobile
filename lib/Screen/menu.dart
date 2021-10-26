import 'package:flutter/material.dart';
import 'package:telework_v2/Screen/TaskScreen2.dart';
import 'package:telework_v2/Screen/taskScreen.dart';

import 'TaskScreen4.dart';
import 'TaskScreen5.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Center(
        //color:Colors.black,
        child: Container(
          color: Colors.black,
          width: 300,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()),
                    );
                  },
                  child: const Text("....")),






              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaskScreen2()),
                    );
                  },
                  child: const Text("taskScreen 2")),






              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaskScreen4()),
                    );
                  },
                  child: const Text("task screen 4")),





              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaskScreen5()),
                    );
                  },
                  child: const Text("task screen 5.0")),






              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaskScreen5()),
                    );
                  },
                  child: const Text("menu1")),
              ElevatedButton(onPressed: () {}, child: const Text("menu1"))
            ],
          ),
        ),
      ),
    );
  }
}
