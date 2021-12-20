import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/test.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:dio/src/response.dart' as dio_resp;

class TestController extends GetxController {
  LearningService _learningService = Get.put(LearningService());
  Rx<Test>? test;
  RxMap<String, dynamic>? values;
  int? courseId;

  @override
  void onInit() {
    super.onInit();
  }

  void loadTest(int _courseId) async {
    EasyLoading.show(status: "loadingText".tr);
    courseId = _courseId;
    Response response = await _learningService.getTest(_courseId);
    if (response.statusCode == 200 && !response.body['error']) {
      Map<String, dynamic> data = response.body['data'];
      test = Test.fromJson(data).obs;
      update();

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
    super.onClose();
  }
}
