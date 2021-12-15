import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/account_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class LogInView extends GetView<AccountController> {
  LogInView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _loginForm,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            hintText: "Nhập email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bạn chưa nhập email.';
                          } else if (!value.isEmail) {
                            return 'Email chưa đúng định dạng.';
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
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: _pwdController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: primaryColor,
                            ),
                            hintText: 'Nhập password'),
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
                            onPressed: () async {
                              if (_loginForm.currentState!.validate()) {
                                EasyLoading.show(status: "Đang đăng nhập...");
                                bool _isLogged = await controller.onLogin(
                                    context,
                                    _emailController.text,
                                    _pwdController.text);
                                if (_isLogged) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Đăng nhập thành công!')),
                                  );
                                  EasyLoading.dismiss();
                                  Get.offNamed(Routes.HOME);
                                }
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'ĐĂNG NHẬP',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: 'Bạn chưa có tài khoản? ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Đăng ký ngay',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
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
