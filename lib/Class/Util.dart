// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util
{


  static String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }




}