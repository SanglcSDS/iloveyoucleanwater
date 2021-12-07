import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static Color mainColor = Color(0xff4980ff);
  int policyRadio = 0;
  List<int> genderValues = [0, 1, 2, 3];
  List<String> genderNames = ['Giới tính', 'Nam', 'Nữ', 'Khác'];
  int gender = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(context),
                  _buildContainer(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Sign up.',
            style: TextStyle(
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
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          // setState(() {
          //   email = value;
          // });
        },
        decoration: const InputDecoration(labelText: 'E-mail *'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          // setState(() {
          //   password = value;
          // });
        },
        decoration: InputDecoration(
          labelText: 'Mật khẩu *',
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.remove_red_eye_outlined, color: kGrey1),
          ),
        ),
      ),
    );
  }

  Widget _buildNameRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: false,
        onChanged: (value) {
          // setState(() {
          //   password = value;
          // });
        },
        decoration: const InputDecoration(
          labelText: 'Họ và tên *',
        ),
      ),
    );
  }

  Widget _buildPhoneNumberRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        obscureText: false,
        onChanged: (value) {
          // setState(() {
          //   password = value;
          // });
        },
        decoration: const InputDecoration(
          labelText: 'Số điện thoại',
        ),
      ),
    );
  }

  Widget _buildDropDownRow(
      List<int> values, List<String> names, int dropdownItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: DropdownButton<int>(
          value: dropdownItem,
          underline: Container(
            height: 1,
            color: kBlack,
          ),
          onChanged: (int? newValue) {
            // setState(() {
            //   dropdownValue = newValue!;
            // });
          },
          items: List.generate(values.length, (index) {
            return DropdownMenuItem(
                value: values[index], child: Text(names[index]));
          })),
    );
  }

  Widget _buildPolicyRow() {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(children: [
        Radio(
          value: policyRadio,
          groupValue: 1,
          onChanged: (value) {
            value == 0 ? value = 1 : policyRadio = 0;
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

  Widget _buildLoginButton(BuildContext context) {
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
            onPressed: () {},
            child: Text(
              "Login",
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
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/images/logo.png")],
                  ),
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildNameRow(),
                _buildPhoneNumberRow(),
                // Row(
                //   children: [
                //     Expanded(
                //       child: _buildPhoneNumberRow(),
                //     ),
                //     _buildDropDownRow(genderValues, genderNames, gender),
                //   ],
                // ),
                _buildPolicyRow(),
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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          // padding: EdgeInsets.zero,
          child: TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
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
