// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TemplateList {
  static final List<AtributeTemplate> myList = [
    AtributeTemplate(id: 0, name: "General")
  ];
}

class AtributeTemplate {
  final String name;
  final int id;

  AtributeTemplate({
    required this.name,
    required this.id,
    Key? key,
  });
}

class MasterTemplate {
  final String templateName;
  final int id;
  final String detail;
  // ignore: non_constant_identifier_names
  MasterTemplate({
    required this.templateName,
    required this.id,
    this.detail = "",
    Key? Key,
  });
}

class MasterTemplateList {
  static List<MasterTemplate> list = [
    MasterTemplate(templateName: "Genaral", id: 0 )
  ];
}
