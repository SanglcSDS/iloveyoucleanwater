import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/test.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';

class TestController extends GetxController {
  LearningService _learningService = Get.put(LearningService());
  PageController? pageController;
  Rx<Test>? test;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void loadTest(int courseId) async {
    debugPrint("Load test");
    Response response = await _learningService.getTest(courseId);
    debugPrint("response   " + response.bodyString!);
    if (response.statusCode == 200 && !response.body['error']) {
      debugPrint("response.status   " + response.status.toString());
      Map<String, dynamic> data = response.body['data'];
      test = Test.fromJson(data).obs;
      debugPrint("question length" + test!.value.questions!.length.toString());

      update();
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    pageController!.dispose();
    super.onClose();
  }
}
