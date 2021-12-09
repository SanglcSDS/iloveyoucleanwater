import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/questions_controller.dart';
import 'package:iloveyoucleanwater/models/learning/question.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class QuestionView extends StatelessWidget {
  QuestionView({Key? key}) : super(key: key);
  final QuestionController controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      initState: (_) {
        controller.currentAnswer = 0.obs;
        controller.values = RxMap();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kGrey1,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Đánh giá khóa học',
            style: TextStyle(color: kGrey1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.questions!.length,
                  itemBuilder: (context, index) {
                    // return _questionItem(index, controller.questions[index]);
                    Question question = controller.questions![index];
                    return Obx(() => _buildQuestion(question, index));
                    // return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(Question question, int qIndex) {
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
              int key = controller.getKey();
              return Row(
                children: [
                  Checkbox(
                      tristate: false,
                      value: controller.values![key],
                      onChanged: (bool? newVal) {
                        debugPrint("Key : " + key.toString());
                        debugPrint("newVal : " + newVal.toString());
                        controller.updateValues(key, newVal!);
                      }),
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
  }

  // Widget _buildQuestion(Question question, int index) {
  //   return Container();
  // }
}
