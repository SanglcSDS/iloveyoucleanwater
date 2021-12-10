import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iloveyoucleanwater/controllers/account/account_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';

class LoginScreen extends GetView<AccountController> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);
  static Color mainColor = const Color(0xff4980ff);
  final AccountController _accountController = AccountController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginForm,
      child: GetBuilder<AccountController>(
        init: AccountController(),
        builder: (_) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xfff2f3f7),
            body: Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildLogo(context),
                      _buildContainer(context),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            onPressed: () => Get.offNamed(Routes.HOME),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Đăng nhập',
            style: GoogleFonts.oswald(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'E-mail'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Bạn chưa nhập email.';
          } else if (!value.isEmail) {
            return 'Email chưa đúng định dạng.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: _pwdController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Mật khẩu',
          // suffixIcon: GestureDetector(
          //   onLongPress: () {
          //     debugPrint(
          //         "======> " + _loginController.showPwd.value.toString());
          //     _loginController.updateShowPwd();
          //   },
          //   child:
          //       const Icon(Icons.remove_red_eye_outlined, color: kGrey1),
          // ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "Quên mật khẩu?",
              style: TextStyle(
                color: kBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              primary: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () async {
              if (_loginForm.currentState!.validate()) {
                bool _isLogged = await _accountController.onLogin(
                    context, _emailController.text, _pwdController.text);
                if (_isLogged) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đăng nhập thành công!')),
                  );
                  Get.offNamed(Routes.HOME);
                }
              }
            },
            child: Text(
              "Đăng nhập",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height - 95,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/images/logo.png")],
                  ),
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(context),
                _buildSignUpBtn(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => Get.offNamed(Routes.REGISTER),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Bạn chưa có tài khoản? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Đăng ký ngay',
                style: TextStyle(
                  color: mainColor,
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
