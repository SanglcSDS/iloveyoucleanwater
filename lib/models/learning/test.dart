class Test {
  late int id;
  late int status;
  late int? totalPoint;
  List<Question>? questions;

  set setQuestion(List<Question> list) {
    questions = list;
  }

  Test({
    required this.id,
    required this.status,
    this.questions,
  });

  Test.fromJson(Map<String, dynamic> json) {
    id = json['test_id'];
    status = json['test_status'];
    totalPoint = json.containsKey('total_point') ? json['total_point'] : null;

    var jsonArr = json['questions'] as List;
    List<Question> listQ = [];
    List<Answer> listA = [];
    for (Map<String, dynamic> item in jsonArr) {
      if (item['type'] == 1) {
        if (listA.isNotEmpty && listQ.isNotEmpty) {
          Question question = listQ.last;
          question.setAnswers = listA;

          listQ.removeLast();
          listQ.add(question);
          listA = [];
        }
        listQ.add(Question.fromJson(item));
      } else {
        listA.add(Answer.fromJson(item));
      }
    }

    // last question
    Question question = listQ.last;
    question.setAnswers = listA;
    listQ.removeLast();
    listQ.add(question);

    questions = listQ;
  }
}

class Question {
  late int id;
  late int type;
  late int point;
  late String content;
  int? status;
  List<Answer>? answers;

  set setAnswers(List<Answer> list) {
    answers = list;
  }

  Question({
    required this.id,
    required this.type,
    required this.point,
    required this.content,
    this.status,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json['type'];
    point = json['point'];
    content = json["content"];
    status = json.containsKey("status") ? json['status'] : null;
  }
}

class Answer {
  late int id;
  late int type;
  late String content;
  int? status;
  int? isChoose;
  int? questionId;

  Answer({
    required this.id,
    required this.type,
    required this.content,
    this.status,
    this.isChoose,
    this.questionId,
  });

  Answer.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json['type'];
    content = json["content"];
    status = json.containsKey("status") ? json['status'] : null;
    isChoose = json.containsKey("is_choose") ? json['is_choose'] : null;
  }

  set setQuestionId(int _questionId) {
    questionId = _questionId;
  }
}
