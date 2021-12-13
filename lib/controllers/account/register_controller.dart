import 'package:flutter/cupertino.dart';
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
  RxList<District> rxDistricts = <District>[].obs;

  @override
  void onInit() {
    debugPrint("oninit ?????");
    genders = <Map<String, dynamic>>[
      {"id": -1, "value": "Giới tính"},
      {"id": 0, "value": "Nam"},
      {"id": 1, "value": "Nữ"},
      {"id": 2, "value": "Khác"},
    ];
    jobs = <Map<String, dynamic>>[
      {"id": -1, "value": "Bạn là"},
      {"id": 0, "value": "Giáo viên"},
      {"id": 1, "value": "Học sinh"},
      {"id": 2, "value": "Khác"},
    ];
    provinces.add(Province(id: 0, name: 'Chọn tỉnh/Thành phố'));
    districts
        .add(District(id: 0, name: 'Chọn Quận/Huyện/Thị xã', provinceId: 0));
    loadDataProvince();
    super.onInit();
  }

  void loadDataProvince() async {
    Response<dynamic> res = await _accountProvider.getDataProvinces();
    var jsonProvince = res.body['provinces'];
    debugPrint("Provinces: " + jsonProvince.toString());
    if (jsonProvince != null) {
      for (var item in jsonProvince) {
        provinces.add(Province.fromJson(item));
      }
    }

    var jsonDistrict = res.body['districts'];
    if (jsonDistrict != null) {
      for (var item in jsonDistrict) {
        districts.add(District.fromJson(item));
      }
      rxDistricts = districts.obs;
    }
    update();
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
    debugPrint("on register!");
    User user = User(
      email: email,
      name: name,
      password: pwd,
      mobile: phone,
      workplace: workplace,
      gender: _gender.value,
      job: _job.value,
      provinceId: _province.value,
      districtId: _district.value,
    );
    Response<dynamic> response = await _accountProvider.register(user);
    if (response.statusCode == 201) {
      return true;
    }
    // Map<String, dynamic> body = response.body;
    // if (!body.containsKey("error")) {
    //   debugPrint("Success!!!!!");
    // } else {
    //   debugPrint(body["errors"].toString());
    // }
    return false;
  }
}
