import 'package:flutter/material.dart';

class Works {
  late String id;
  late String title;
  late String summary;
  late DateTime dateCompelete;
  late String importance;

  Works(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    summary = element['summary'];
    dateCompelete = DateTime.parse(element['dateCompelete']);
    importance = element['importance'];
  }
}
