import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class ChangePasswordController extends GetxController {
  AccountProvider _accountProvider = AccountProvider();
  void onChangePwd(BuildContext context, String oldPwd, String newPwd,
      String confirmPwd) async {
    EasyLoading.show(status: "change_pwd_progress".tr);
    Response response =
        await _accountProvider.changePassword(oldPwd, newPwd, confirmPwd);
    if (response.statusCode == 200 && !response.body["error"]) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('change_pwd_success'.tr),
          backgroundColor: primaryColor,
        ),
      );
      GetStorage().remove("token");
      GetStorage().remove("expiresAt");
      GetStorage().remove("username");
      Get.offNamed(Routes.LOGIN);
      EasyLoading.dismiss();
    } else {
      Map<String, dynamic> mess = response.body;
      if (mess.containsKey('message')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body['message']),
            backgroundColor: primaryColor,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('change_pwd_err_default'.tr),
            backgroundColor: primaryColor,
          ),
        );
      }
      EasyLoading.dismiss();
    }
  }
}
