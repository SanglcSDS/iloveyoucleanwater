import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/msg_dialog.dart';

class AccountController extends GetxController {
  final AccountProvider _accountProvider = Get.put(AccountProvider());
  final CourseController _courseController = Get.put(CourseController());
  final GetStorage box = GetStorage();
  @override
  void onInit() {
    // if (box.read("token") != null) {
    //   box.remove("token");
    // }
    super.onInit();
  }

  Future<bool> onLogin(context, String email, String password) async {
    Response<dynamic> response = await _accountProvider.login(email, password);
    int statusCode = response.statusCode!;
    if (statusCode == 200) {
      // MsgDia

      debugPrint(response.body["access_token"]);
      Map<String, dynamic> json = response.body;
      try {
        String token = json['access_token'];
        String tokenType = json['token_type'];
        if (box.hasData("token")) {
          await box.remove("token");
        }
        if (box.hasData("expiresAt")) {
          await box.remove("expiresAt");
        }
        await box.write("token", tokenType + " " + token);
        await box.write("expiresAt", json['expires_at']);
        _courseController.isLogged = true.obs;
        _courseController.initData();
        return true;
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (statusCode == 401) {
      MsgDialog.showWarningDialogs(context, "login_msg_fail_title".tr,
          "login_msg_fail_content".tr);
      EasyLoading.dismiss();
    } else {
      MsgDialog.showWarningDialogs(context, "login_msg_fail_title".tr,
          "login_msg_fail_content".tr);
      EasyLoading.dismiss();
    }
    return false;
  }
}
