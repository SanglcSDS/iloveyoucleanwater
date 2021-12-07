import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';

class AccountController extends GetxController {
  AccountProvider _accountProvider = AccountProvider();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onLogin(String email, String password) async {
    // bool isValid = authBloc.isValidLogin(
    //     _emailController.text, _currentPassController.text);
    // if (isValid) {
    //   //show loading
    //   LoadingDialog.showLoadingDialog(Get.overlayContext, "Loading...");
    //   if (userName != null && passWord != null && deviceId != null) {
    //     int checkLogin = await controller.checkLogin(new User(
    //         username: userName, password: passWord, deviceId: deviceId));
    //     //hide loading
    //     Navigator.pop(Get.overlayContext, true);
    //     if (checkLogin == 200) {
    //       Get.toNamed(Routes.HOME);
    //       // Get.to(Routes.HOME);
    //     } else if (checkLogin == 401) {
    //       MsgDialog.showMsgDialogs(Get.overlayContext, 'Thông báo',
    //           'Tài khoản hoặc mật khẩu không chính xác', () => Get.back());
    //     } else {
    //       MsgDialog.showMsgDialogs(Get.overlayContext, 'Thông báo',
    //           'Có lỗi xảy ra, vui lòng thử lại sau', () => Get.back());
    //     }
    //   }
    // }
    Response<dynamic> response = await _accountProvider.login(email, password);
    debugPrint("email: " + email + " / password: " + password);
    debugPrint("response: " + response.statusCode.toString());
    int statusCode = response.statusCode!;
    if (statusCode != 200) {
      // MsgDia
    }

    Get.offNamed(Routes.HOME);
  }
}
