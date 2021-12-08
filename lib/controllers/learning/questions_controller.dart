import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/question.dart';

class QuestionController extends GetxController {
  RxMap<int, bool>? values;
  RxList<Question>? questions;
  RxInt? currentAnswer;
  int answerCount = 0;

  @override
  void onInit() {
    loadQuestions();
    super.onInit();
  }

  void loadQuestions() async {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    final data = await json.decode(response);
    var questionJson = data["questions"] as List;
    questions = questionJson.map((e) => Question.fromJson(e)).toList().obs;
    answerCount = data["totalAnswer"];
    for (int i = 0; i < answerCount; i++) {
      values!.putIfAbsent(i, () => false);
    }
    update();
  }

  void updateValues(int key, bool newVal) {
    values![key] = values![key] == true ? false : true;
    debugPrint(values!.toString());
  }

  int getKey() {
    int key;
    key = currentAnswer! > answerCount ? 0 : currentAnswer!.value;
    currentAnswer = (currentAnswer!.value + 1).obs;
    return key;
  }
}
