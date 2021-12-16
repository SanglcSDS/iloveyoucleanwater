import 'package:flutter/cupertino.dart';
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
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'test_title'.tr,
            style: TextStyle(color: primaryColor),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.test == null
              ? SizedBox()
              : PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: List.generate(
                      controller.test!.value.questions!.length,
                      (index) => _questionView(
                          controller.test!.value.questions![index], index)),
                ),
        ),
      ),
    );
  }

  Widget _questionView(Question question, int index) {
    return SizedBox(
      child: Column(
        children: [
          Text("question_text ======> " + question.content),
          Column(
            children: List.generate(question.answers!.length, (ansIndex) {
              return TextButton(
                child: Text(question.answers![ansIndex].content),
                onPressed: () {},
              );
            }),
          ),
          index == (controller.test!.value.questions!.length - 1)
              ? Theme(
                  data: ThemeData(primarySwatch: kPrimaryMaterial),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('End'),
                  ),
                )
              : Theme(
                  data: ThemeData(primarySwatch: kPrimaryMaterial),
                  child: ElevatedButton(
                    onPressed: () async => await controller.pageController!
                        .nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.bounceInOut),
                    child: Text('Next'),
                  ),
                )
        ],
      ),
    );
  }
}
