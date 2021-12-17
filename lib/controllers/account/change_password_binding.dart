import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
