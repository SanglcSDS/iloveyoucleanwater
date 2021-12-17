import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/test.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:dio/src/response.dart' as dio_resp;

class TestController extends GetxController {
  LearningService _learningService = Get.put(LearningService());
  PageController? pageController;
  Rx<Test>? test;
  RxMap<String, dynamic>? values;
  int? courseId;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void loadTest(int _courseId) async {
    EasyLoading.show(status: "loadingText".tr);
    courseId = _courseId;
    debugPrint("Load test");
    Response response = await _learningService.getTest(_courseId);
    debugPrint("response   " + response.bodyString!);
    if (response.statusCode == 200 && !response.body['error']) {
      debugPrint("response.status   " + response.status.toString());
      Map<String, dynamic> data = response.body['data'];
      test = Test.fromJson(data).obs;
      debugPrint("question length" + test!.value.questions!.length.toString());

      Map<String, dynamic> result = {};
      for (int i = 0; i < test!.value.questions!.length; i++) {
        result.putIfAbsent(i.toString(), () => null);
      }
      values = result.obs;
      update();
    } else {
      Get.toNamed(Routes.LOGIN);
    }
    EasyLoading.dismiss();
  }

  void chooseAnswer(int qIndex, int newVal) {
    values!.update(qIndex.toString(), (value) => newVal);
  }

  void sendTest() async {
    EasyLoading.show(status: "test_send_loading".tr);
    dio_resp.Response response = await _learningService.postTest(values!);
    if (response.statusCode == 200 && !response.data['error']) {
      debugPrint('success');

      loadTest(courseId!);
      update();
    }
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    pageController!.dispose();
    super.onClose();
  }
}
