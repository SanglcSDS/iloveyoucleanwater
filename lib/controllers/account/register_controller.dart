import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/account/city.dart';
import 'package:iloveyoucleanwater/models/account/user.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';

class RegisterController extends GetxController {
  final AccountProvider _accountProvider = Get.put(AccountProvider());
  late List<Map<String, dynamic>> genders;
  late List<Map<String, dynamic>> jobs;
  RxBool policyRadio = false.obs;
  RxInt _gender = (-1).obs;
  RxInt _job = (-1).obs;
  RxInt _province = 0.obs;
  RxInt _district = 0.obs;
  List<Province> provinces = <Province>[];
  List<District> districts = <District>[];
  RxList<Province> rxProvinces = <Province>[].obs;
  RxList<District> rxDistricts = <District>[].obs;

  @override
  void onInit() {
    genders = <Map<String, dynamic>>[
      {"id": 0, "value": "signup_gender_male".tr},
      {"id": 1, "value": "signup_gender_female".tr},
      {"id": 2, "value": "signup_gender_other".tr},
    ];
    jobs = <Map<String, dynamic>>[
      {"id": 0, "value": "signup_you_are_teacher".tr},
      {"id": 1, "value": "signup_you_are_student".tr},
      {"id": 2, "value": "signup_you_are_other".tr},
    ];
    loadDataProvince();
    super.onInit();
  }

  Future<void> loadDataProvince() async {
    EasyLoading.show(status: "Loading...");
    Response<dynamic> res = await _accountProvider.getDataProvinces();
    if (res.statusCode == 200) {
      var jsonProvince = res.body['provinces'];
      if (jsonProvince != null) {
        for (var item in jsonProvince) {
          provinces.add(Province.fromJson(item));
        }
      }
      rxProvinces = provinces.obs;

      var jsonDistrict = res.body['districts'];
      if (jsonDistrict != null) {
        for (var item in jsonDistrict) {
          districts.add(District.fromJson(item));
        }
        rxDistricts = districts.obs;
      }
      update();
    }
    EasyLoading.dismiss();
  }

  void onChangeProvince(Province province) {
    _province = province.id.obs;
    if (province.id > 0) {
      rxDistricts = districts
          .where((element) => element.provinceId == province.id)
          .toList()
          .obs;
    } else {
      rxDistricts = districts.obs;
    }
    _district = rxDistricts[0].id.obs;

    update();
  }

  void onChangeDistrict(District district) {
    _district = district.id.obs;
    update();
  }

  void onChangeGender(Map<String, dynamic> newValue) {
    _gender.value = newValue["id"];
    update();
  }

  void onChangeJob(Map<String, dynamic> newValue) {
    _job.value = newValue["id"];
    update();
  }

  Future<bool> onRegister(BuildContext context, String email, String pwd,
      String name, String phone, String workplace) async {
    User user = User(
      email: email,
      name: name,
      password: pwd,
      mobile: phone,
      workplace: workplace,
      gender: _gender.value < 0 ? genders[0]["id"] : _gender.value,
      job: _job.value < 0 ? jobs[0]["id"] : _job.value,
      provinceId: _province.value <= 0 ? rxProvinces[0].id : _province.value,
      districtId: _district.value <= 0 ? rxDistricts[0].id : _district.value,
    );
    Response<dynamic> response = await _accountProvider.register(user);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
