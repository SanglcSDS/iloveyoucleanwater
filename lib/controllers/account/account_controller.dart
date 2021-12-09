import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';

class AccountController extends GetxController {
  final AccountProvider _accountProvider = Get.put(AccountProvider());
  final CourseController _courseController = Get.put(CourseController());
  final GetStorage box = GetStorage();
  @override
  void onInit() {
    if (box.read("token") != null) {
      box.remove("token");
    }
    super.onInit();
  }

  Future<void> onLogin(String email, String password) async {
    Response<dynamic> response = await _accountProvider.login(email, password);
    debugPrint("email: " + email + " / password: " + password);
    debugPrint("response: " + response.statusCode.toString());
    int statusCode = response.statusCode!;
    if (statusCode == 200) {
      // MsgDia
      Map<String, dynamic> json = response.body;
      try {
        String token = json['access_token'];
        String tokenType = json['token_type'];
        await box.write("token", tokenType + " " + token);
        await box.write("expiresAt", json['expires_at']);
        debugPrint(box.read("token"));
      } catch (e) {
        debugPrint(e.toString());
      }

      _courseController.setLogged();
      Get.offNamed(Routes.HOME);
    }
  }
}
