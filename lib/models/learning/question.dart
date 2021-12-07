class Question {
  String text;
  List<Answer> answers;
  bool hasOther;

  Question({
    required this.text,
    required this.answers,
    required this.hasOther,
  });

  Question.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        answers = json["answers"].map((e) => Answer.fromJson(e)).toList(),
        hasOther = json["hasOther"];
}

class Answer {
  int index;
  String text;

  Answer({
    required this.index,
    required this.text,
  });

  Answer.fromJson(Map<String, dynamic> json)
      : index = json["index"],
        text = json["text"];
}
