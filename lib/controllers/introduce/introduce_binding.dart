import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';

class IntroduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IntroduceController>(IntroduceController());
  }
}
