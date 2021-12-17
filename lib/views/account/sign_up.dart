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
          title: Text('signup'.tr),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _signUpForm,
                  child: Column(
                    children: [
                      Theme(
                        data: ThemeData(primarySwatch: kPrimaryMaterial),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: primaryColor,
                              ),
                              hintText: "signup_email".tr),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'validate_email_empty'.tr;
                            } else if (!value.isEmail) {
                              return 'validate_email_invalid'.tr;
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
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: primaryColor,
                                ),
                                hintText: 'signup_password'.tr),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'validate_password_empty'.tr;
                              } else if (value.length < 8) {
                                return 'validate_password_invalid'.tr;
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              hintText: 'signup_name'.tr),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'validate_name_empty'.tr;
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
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: primaryColor,
                              ),
                              hintText: 'signup_phone'.tr),
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
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.work,
                              color: primaryColor,
                            ),
                            hintText: 'signup_workplace'.tr,
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
                          // selectedItem: {"id": -1, "value": "signup_gender".tr},
                          selectedItem: controller.genders[0],
                          label: "signup_gender".tr,
                          itemAsString: (Map<String, dynamic> item) =>
                              item['value'],
                          onChange: (Map<String, dynamic>? newValue) {
                            controller.onChangeGender(newValue!);
                            controller.update();
                          },
                          showSearchBox: true,
                          validation: (value) {
                            if (value == null || value["id"] < 0) {
                              return 'validate_gender_empty'.tr;
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
                          label: "signup_you_are".tr,
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
                              text: TextSpan(
                                text: 'sign_up_policy_1'.tr,
                                style: TextStyle(color: kBlack),
                                children: [
                                  TextSpan(
                                      text: 'sign_up_policy_2'.tr,
                                      style: TextStyle(color: primaryColor)),
                                  TextSpan(
                                    text: 'sign_up_policy_3'.tr,
                                    style: TextStyle(color: kBlack),
                                  ),
                                  TextSpan(
                                      text: 'sign_up_policy_4'.tr,
                                      style: TextStyle(color: primaryColor)),
                                  TextSpan(
                                    text: 'sign_up_policy_5'.tr,
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
                                  bool isRegisted = await controller.onRegister(
                                      context,
                                      _emailController.text,
                                      _pwdController.text,
                                      _nameController.text,
                                      _phoneController.text,
                                      _workplaceController.text);
                                  if (isRegisted == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('sign_up_success'.tr),
                                        backgroundColor: primaryColor,
                                      ),
                                    );
                                    Get.offNamed(Routes.LOGIN);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('sign_up_unsuccess'.tr),
                                        backgroundColor: primaryColor,
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'signup_btn'.tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.LOGIN),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'log_in_question'.tr,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'login'.tr,
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
