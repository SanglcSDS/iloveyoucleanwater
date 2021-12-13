import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';

class Course {
  late int id;
  late String title;
  List<Lesson>? lessons;
  List<Comment>? comments;
  List<Document>? documents;
  double? percentComplete;
  Color? color;

  final List<Color> _colors = [
    Colors.grey,
    Color(Colors.blueGrey[200]!.value),
    Colors.blueAccent,
    Colors.lime,
    Color(Colors.green[200]!.value),
    Color(Colors.brown[300]!.value),
  ];

  Course({
    required this.id,
    required this.title,
    this.lessons,
    this.comments,
    this.documents,
    this.percentComplete,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    var lessonJson = json["lessons"] as List;
    lessons = lessonJson.map((e) => Lesson.fromJson(e)).toList();
    var commentJson = json["comments"] as List;
    comments = commentJson.map((e) => Comment.fromJson(e)).toList();
    var documentJson = json["documents"] as List;
    documents = documentJson.map((e) => Document.fromJson(e)).toList();

    color = _randomColor();
  }

  Color _randomColor() {
    Random random = Random();
    int index = random.nextInt(_colors.length);
    return _colors[index];
  }
}
