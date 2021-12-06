import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/questions_controller.dart';
import 'package:iloveyoucleanwater/models/learning/question.dart';

class QuestionView extends StatelessWidget {
  final controller = QuestionController();

  QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Đánh giá khóa học'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.questions.length,
                itemBuilder: (context, index) {
                  // return _questionItem(index, controller.questions[index]);
                  Question question = controller.questions[index];
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.all(5),
                        child: Text(question.text),
                      ),
                      Column(
                        children: List.generate(
                          question.answers.length,
                          (index) {
                            return Row(
                              children: [
                                Checkbox(
                                    value: false, onChanged: (bool? value) {}),
                                Expanded(
                                  child: Text(
                                    question.answers[index].text,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
