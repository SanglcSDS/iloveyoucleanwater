import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/register_controller.dart';
import 'package:iloveyoucleanwater/models/account/city.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/dropdown_search_widget.dart';

class SignUpView extends GetView<RegisterController> {
  SignUpView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _signUpForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _workplaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Đăng ký'),
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
              // const SizedBox(
              //   height: 40,
              // ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _signUpForm,
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: 40,
                      // ),
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
                              hintText: "Email *"),
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
                                hintText: 'Mật khẩu *'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mật khẩu.';
                              } else if (value.length < 8) {
                                return 'Mật khẩu cần có ít nhất 8 ký tự Ví dụ: Mizuiku123';
                              }
                              return null;
                            }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _nameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              hintText: 'Họ và tên *'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tên (ghi tiếng Việt có dấu).';
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
                          controller: _phoneController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: primaryColor,
                              ),
                              hintText: 'Số điện thoại'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: TextFormField(
                          controller: _workplaceController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.work,
                              color: primaryColor,
                            ),
                            hintText: 'Nơi công tác',
                          ),
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: CustomDropdown(
                          items: controller.genders,
                          selectedItem: const {
                            "id": -1,
                            "value": "Giới tính *"
                          },
                          label: "Giới tính *",
                          itemAsString: (Map<String, dynamic> item) =>
                              item['value'],
                          onChange: (Map<String, dynamic>? newValue) {
                            controller.onChangeGender(newValue!);
                          },
                          showSearchBox: true,
                          validation: (value) {
                            if (value == null || value["id"] < 0) {
                              return 'Vui lòng chọn giới tính.';
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
                        child: CustomDropdown(
                          items: controller.jobs,
                          selectedItem: controller.jobs[0],
                          label: "Bạn là",
                          itemAsString: (Map<String, dynamic> item) =>
                              item['value'],
                          onChange: (Map<String, dynamic>? newValue) {
                            controller.onChangeJob(newValue!);
                          },
                          showSearchBox: true,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: Obx(
                          () => controller.rxProvinces.isEmpty
                              ? const SizedBox()
                              : CustomDropdown(
                                  items: controller.rxProvinces,
                                  selectedItem: controller.rxProvinces[0],
                                  label: "",
                                  itemAsString: (Province p) => p.name,
                                  onChange: (Province p) =>
                                      controller.onChangeProvince(p),
                                  showSearchBox: true,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: Obx(
                          () => controller.rxDistricts.isEmpty
                              ? const SizedBox()
                              : CustomDropdown(
                                  items: controller.rxDistricts,
                                  selectedItem: controller.rxDistricts[0],
                                  label: "",
                                  itemAsString: (District d) => d.name,
                                  onChange: (District d) =>
                                      controller.onChangeDistrict(d),
                                  showSearchBox: true,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: Row(children: [
                          Checkbox(
                            value: controller.policyRadio.value,
                            onChanged: (bool? value) {
                              controller.policyRadio = value!.obs;
                              controller.update();
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
                                      style: TextStyle(color: primaryColor)),
                                  TextSpan(
                                    text: 'và ',
                                    style: TextStyle(color: kBlack),
                                  ),
                                  TextSpan(
                                      text: 'Chính sách bảo mật ',
                                      style: TextStyle(color: primaryColor)),
                                  TextSpan(
                                    text: 'của hệ thống trực tuyến này?',
                                    style: TextStyle(color: kBlack),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
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
                                if (_signUpForm.currentState!.validate()) {
                                  debugPrint("validated");
                                  bool isRegisted = await controller.onRegister(
                                      context,
                                      _emailController.text,
                                      _pwdController.text,
                                      _nameController.text,
                                      _phoneController.text,
                                      _workplaceController.text);
                                  if (isRegisted == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Đăng ký thành công!')),
                                    );
                                    Get.offNamed(Routes.LOGIN);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Đăng ký không thành công')),
                                    );
                                  }
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'ĐĂNG KÝ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.LOGIN),
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: 'Bạn đã có tài khoản. ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Đăng nhập',
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
      ),
    );
  }
}
