import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/models/account/user.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class AccountProvider extends GetConnect {
  Future<Response> getDataProvinces() {
    return get("${Constants.SERVER_URL}/get-data-province", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response> getUserInfo() {
    return get("${Constants.SERVER_URL}/auth/user", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response> login(String email, String password) {
    Map<String, String> info = {
      "email": email,
      "password": password,
    };
    return post("${Constants.SERVER_URL}/auth/login", info);
  }

  Future<Response> register(User user) {
    return post("${Constants.SERVER_URL}/auth/signup", user.toJson(), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response> logout(String email, String password) {
    Map<String, String> info = {
      "email": email,
      "password": password,
    };
    return post("${Constants.SERVER_URL}/auth/logout", info, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response> changePassword(
      String oldPwd, String newPwd, String confirmPwd) {
    Map<String, String> info = {
      "old_password": oldPwd,
      "new_password": newPwd,
      "confirm_password": confirmPwd
    };
    return post("${Constants.SERVER_URL}/auth/change-password", info, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${GetStorage().read('token')}',
    });
  }
}
