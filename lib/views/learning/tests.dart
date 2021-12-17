import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/tests_controller.dart';
import 'package:iloveyoucleanwater/models/learning/test.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class TestView extends GetView<TestController> {
  TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'course_quiz'.tr,
            style: TextStyle(color: primaryColor),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    // Điểm thi
                    controller.test!.value.totalPoint == null
                        ? const SizedBox()
                        : Column(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: 80,
                                      child: Image.asset(
                                          "assets/images/tick-icon.png"))),
                              const SizedBox(height: 16),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'test_submitted'.tr,
                                    style: TextStyle(fontSize: 14),
                                  )),
                              SizedBox(
                                height: 80,
                                child: Card(
                                  elevation: 0.5,
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'test_total_point'.tr,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${controller.test!.value.totalPoint}',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'test_show_answer'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                    Column(
                      children: List.generate(
                          controller.test!.value.questions!.length, (index) {
                        return _buildEvalution(
                            controller.test!.value.questions![index], index);
                      }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                controller.test!.value.totalPoint == null
                    ? Row(
                        children: [
                          Expanded(child: const SizedBox()),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Theme(
                              data: ThemeData(primarySwatch: kPrimaryMaterial),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controller.sendTest();
                                },
                                label: Text(
                                  'test_btn'.tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEvalution(Question question, int qIndex) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${qIndex + 1}. ${question.content}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )),
        Column(
          children: List.generate(
            question.answers!.length,
            (index) {
              Answer answer = question.answers![index];
              return answer.status == null
                  ? Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: ListTile(
                        title: Text(answer.content,
                            style: TextStyle(
                                color: controller.values![qIndex.toString()] ==
                                        answer.id
                                    ? primaryColor
                                    : Colors.black)),
                        leading: Radio<int?>(
                          value: answer.id,
                          groupValue: controller.values![qIndex.toString()],
                          onChanged: (int? value) {
                            controller.chooseAnswer(qIndex, value!);
                            controller.update();
                          },
                        ),
                      ),
                    )
                  : Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: ListTile(
                        title: Text(
                          '. ${answer.content}',
                          style: TextStyle(
                            color: answer.status == 1
                                ? primaryColor
                                : answer.isChoose == 1
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                      ));
            },
          ),
        )
      ],
    );
  }
}
