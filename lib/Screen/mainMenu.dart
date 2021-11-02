// ignore: file_names
// ignore_for_file: file_names

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:telework_v2/widgets/controls.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main menu"),
      ),
      body: GridManu(),
    );
  }
}

