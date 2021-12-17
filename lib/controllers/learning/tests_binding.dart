import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/tests_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TestController>(TestController());
  }
}
