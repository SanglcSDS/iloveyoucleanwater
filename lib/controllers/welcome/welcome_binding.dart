import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }
}
