import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iloveyoucleanwater/controllers/account/register_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();
  RegisterScreen({Key? key}) : super(key: key);
  final RegisterController _controller = Get.put(RegisterController());
  static Color mainColor = const Color(0xff4980ff);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerForm,
      child: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (_) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xfff2f3f7),
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _buildLogo(context),
                  _buildContainer(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildLogo(BuildContext context) {
  //   return Row(
  //     children: <Widget>[
  //       IconButton(
  //           onPressed: () => Get.back(),
  //           icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 20),
  //         child: Text(
  //           'Đăng ký',
  //           style: GoogleFonts.oswald(
  //             fontSize: MediaQuery.of(context).size.height / 25,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildEmailRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập email.';
          } else if (!value.isEmail) {
            return 'Email không đúng định dạng.';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(labelText: 'E-mail *'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: _pwdController,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Mật khẩu *',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập mật khẩu.';
            } else if (value.length < 8) {
              return 'Mật khẩu cần có ít nhất 8 ký tự Ví dụ: Mizuiku123';
            }
            return null;
          }),
    );
  }

  Widget _buildNameRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText: 'Họ và tên *',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập tên (ghi tiếng Việt có dấu).';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPhoneNumberRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: _phoneController,
        decoration: const InputDecoration(
          labelText: 'Số điện thoại',
        ),
      ),
    );
  }

  Widget _buildGenderDropdown(List<Map<String, dynamic>> _values) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<int>(
          value: _controller.gender.value,
          underline: Container(
            height: 1,
            color: kBlack,
          ),
          onChanged: (int? newValue) {
            _controller.gender = newValue!.obs;
            _controller.update();
          },
          items: List.generate(_values.length, (index) {
            return DropdownMenuItem(
              value: _values[index]["id"],
              child: Text(_values[index]["value"]),
            );
          })),
    );
  }

  Widget _buildPolicyRow() {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(children: [
        Checkbox(
          value: _controller.policyRadio.value,
          onChanged: (bool? value) {
            _controller.policyRadio = value!.obs;
            _controller.update();
          },
        ),
        Expanded(
          child: RichText(
            text: const TextSpan(
              text: 'Bạn có đồng ý với ',
              style: TextStyle(color: kBlack),
              children: [
                TextSpan(
                    text: 'Điều khoản sử dụng ',
                    style: TextStyle(color: kBlue1)),
                TextSpan(
                  text: 'và ',
                  style: TextStyle(color: kBlack),
                ),
                TextSpan(
                    text: 'Chính sách bảo mật ',
                    style: TextStyle(color: kBlue1)),
                TextSpan(
                  text: 'của hệ thống trực tuyến này?',
                  style: TextStyle(color: kBlack),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              primary: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () async {
              if (_registerForm.currentState!.validate()) {
                bool isRegisted = await _controller.onRegister(context);
                if (isRegisted == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đăng ký thành công!')),
                  );
                  Get.toNamed(Routes.LOGIN);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đăng ký không thành công')),
                  );
                }
              }
            },
            child: Text(
              "Đăng ký",
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
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 50, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Image.asset("assets/images/logo.png")],
          ),
        ),
        _buildEmailRow(),
        _buildPasswordRow(),
        _buildNameRow(),
        _buildPhoneNumberRow(),
        Row(
          children: [
            Obx(() => _buildGenderDropdown(_controller.genders)),
          ],
        ),
        Obx(() => _buildPolicyRow()),
        _buildRegisterButton(context),
        _buildLoginBtn(context),
      ],
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
            onPressed: () => Get.offNamed(Routes.LOGIN),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Bạn đã có tài khoản. Vui lòng ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Đăng nhập',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height / 45,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
