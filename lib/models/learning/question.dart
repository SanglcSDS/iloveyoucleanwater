class Question {
  String text;
  List<Answer> answers;
  bool hasOther;

  Question({
    required this.text,
    required this.answers,
    required this.hasOther,
  });
}

class Answer {
  int index;
  String text;
  // bool value = false;

  Answer({
    required this.index,
    required this.text,
  });
}
