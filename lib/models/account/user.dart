import 'package:iloveyoucleanwater/models/account/city.dart';

class User {
  String email;
  String? password;
  String name;
  String? mobile;
  int? gender;
  int? job;
  District? district;
  String? workplace;
  String? birthday; //format dd/MM/yyyy
  bool? isLock;
  bool? status;
  String? avatar;
  int? provinceId;
  int? districtId;

  User({
    required this.email,
    this.password,
    required this.name,
    this.mobile,
    this.gender,
    this.job,
    this.district,
    this.workplace,
    this.birthday,
    this.isLock,
    this.status,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        mobile = json['mobile'],
        gender = json['gender'],
        birthday = json['birthday'],
        status = json['status'],
        isLock = json['is_lock'],
        job = json['job'],
        provinceId = json['province_id'],
        districtId = json['district_id'],
        workplace = json['workplace'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['username'] = null;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['status'] = null;
    data['is_lock'] = null;
    data['province_id'] = district!.provinceId;
    data['district_id'] = district!.id;
    data['job'] = job;
    data['workplace'] = workplace;
    data['avatar'] = avatar;
    return data;
  }
}
