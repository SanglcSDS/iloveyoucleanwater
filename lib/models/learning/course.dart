import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';

class Course {
  late String title;
  List<Lesson>? lessons;
  List<Comment>? comments;
  List<Document>? documents;
  double? percentComplete;

  Course({
    required this.title,
    this.lessons,
    this.comments,
    this.documents,
    this.percentComplete,
  });

  Course.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    var lessonJson = json["lessons"] as List;
    lessons = lessonJson.map((e) => Lesson.fromJson(e)).toList();
    var commentJson = json["comments"] as List;
    comments = commentJson.map((e) => Comment.fromJson(e)).toList();
    var documentJson = json["documents"] as List;
    documents = documentJson.map((e) => Document.fromJson(e)).toList();
  }
}
