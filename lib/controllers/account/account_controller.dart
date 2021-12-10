import 'package:flutter/cupertino.dart';
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
    if (box.read("token") != null) {
      box.remove("token");
    }
    super.onInit();
  }

  Future<bool> onLogin(context, String email, String password) async {
    Response<dynamic> response = await _accountProvider.login(email, password);
    int statusCode = response.statusCode!;
    if (statusCode == 200) {
      // MsgDia
      Map<String, dynamic> json = response.body;
      try {
        String token = json['access_token'];
        String tokenType = json['token_type'];
        await box.write("token", tokenType + " " + token);
        await box.write("expiresAt", json['expires_at']);
        _courseController.isLogged = true.obs;
        _courseController.initData();
        return true;
      } catch (e) {
        debugPrint(e.toString());
      }
    } else if (statusCode == 401) {
      MsgDialog.showWarningDialogs(context, "Login failed!",
          "Mật khẩu hoặc tài khoản không đúng! Vui lòng đăng nhập lại.");
    } else {
      MsgDialog.showWarningDialogs(context, "Login failed!",
          "Đăng nhập không thành công! Vui lòng đăng nhập lại.");
    }
    return false;
  }
}
