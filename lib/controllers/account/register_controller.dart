import 'package:get/get.dart';
import 'package:iloveyoucleanwater/service/account/account_service.dart';

class RegisterController extends GetxController {
  final AccountProvider _accountProvider = Get.put(AccountProvider());
  final List<Map<String, dynamic>> genders = <Map<String, dynamic>>[
    {"id": -1, "value": "Giới tính"},
    {"id": 0, "value": "Nam"},
    {"id": 1, "value": "Nữ"},
    {"id": 2, "value": "Khác"},
  ];
  RxBool policyRadio = false.obs;
  RxInt gender = (-1).obs;
  Future<bool> onRegister(context) async {
    return true;
  }
}
