import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/change_password_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _changePwdForm = GlobalKey<FormState>();
  final TextEditingController _oldPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change_pwd_title'.tr),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              height: 40,
              padding: EdgeInsets.zero,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/logo.png'),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _changePwdForm,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: TextFormField(
                        controller: _oldPwdController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            hintText: "change_pwd_old".tr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validate_password_empty'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: TextFormField(
                        controller: _newPwdController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            hintText: "change_pwd_new".tr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validate_password_empty'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: TextFormField(
                        controller: _confirmPwdController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            hintText: "change_pwd_confirm".tr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validate_password_empty'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_changePwdForm.currentState!.validate()) {
                                EasyLoading.show(
                                    status: 'login_on_progress'.tr);
                                controller.onChangePwd(
                                    context,
                                    _oldPwdController.text,
                                    _newPwdController.text);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'change_pwd_btn'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
