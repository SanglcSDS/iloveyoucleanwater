import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
