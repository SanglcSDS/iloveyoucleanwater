import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/register_controller.dart';
import 'package:iloveyoucleanwater/models/account/city.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/dropdown_search_widget.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();
  RegisterScreen({Key? key}) : super(key: key);
  final RegisterController _controller = Get.put(RegisterController());
  static Color mainColor = const Color(0xff4980ff);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _workplaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerForm,
      child: GetBuilder<RegisterController>(
        init: RegisterController(),
        // initState: (_) => _controller.loadDataProvince(),
        builder: (_) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              reverse: true,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _buildLogo(context),
                  _buildContainer(context),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: _phoneController,
        decoration: const InputDecoration(
          labelText: 'Số điện thoại',
        ),
      ),
    );
  }

  Widget _buildGenderDropdown(
      List<Map<String, dynamic>> _values, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width / 2 - 60,
      height: 45,
      child: CustomDropdown(
        items: _values,
        selectedItem: _values[0],
        label: "Giới tính *",
        itemAsString: (Map<String, dynamic> item) => item['value'],
        onChange: (Map<String, dynamic>? newValue) {
          _controller.onChangeGender(newValue!);
        },
        showSearchBox: true,
      ),
    );
  }

  Widget _buildJobDropdown(
      List<Map<String, dynamic>> _values, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width / 2,
      height: 45,
      child: CustomDropdown(
        items: _values,
        selectedItem: _values[0],
        label: "Bạn là",
        itemAsString: (Map<String, dynamic> item) => item['value'],
        onChange: (Map<String, dynamic>? newValue) {
          _controller.onChangeJob(newValue!);
        },
        showSearchBox: true,
      ),
    );
  }

  Widget _buildProvinceDropdown(List<Province> _provinces) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 45,
      child: CustomDropdown(
        items: _provinces,
        selectedItem: _provinces[0],
        label: "Tỉnh/Thành phố *",
        itemAsString: (Province p) => p.name,
        onChange: (Province p) => _controller.onChangeProvince(p),
        showSearchBox: true,
        // validation: (Province p) {
        //   if (p.id <= 0) {
        //     return 'Chọn Tỉnh/thành phố';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget _buildDistrictDropdown(List<District> _districts) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      height: 45,
      child: CustomDropdown(
        items: _districts,
        selectedItem: _districts[0],
        label: "Quận/Huyện *",
        itemAsString: (District d) => d.name,
        onChange: (District d) => _controller.onChangeDistrict(d),
        showSearchBox: true,
        // validation: (value) {
        //   if (value == null || value!.id <= 0) {
        //     return 'Chọn Quận/huyện';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget _buildWorkplace() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _workplaceController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText: 'Nơi công tác',
        ),
        validator: (value) {
          return null;
        },
      ),
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
                bool isRegisted = await _controller.onRegister(
                    context,
                    _emailController.text,
                    _pwdController.text,
                    _nameController.text,
                    _phoneController.text,
                    _workplaceController.text);
                if (isRegisted == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đăng ký thành công!')),
                  );
                  Get.offNamed(Routes.LOGIN);
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
            _buildJobDropdown(_controller.jobs, context),
            _buildGenderDropdown(_controller.genders, context),
          ],
        ),
        _buildProvinceDropdown(_controller.provinces),
        Obx(() => _buildDistrictDropdown(_controller.rxDistricts)),
        _buildWorkplace(),
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
