import 'package:iloveyoucleanwater/models/account/city.dart';

class User {
  String name;
  String email;
  String? mobile;
  int? gender;
  String? password;
  int? job;
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
    this.workplace,
    this.birthday,
    this.isLock,
    this.status,
    this.avatar,
    this.provinceId,
    this.districtId,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        mobile = json['mobile'],
        gender = json['gender'],
        status = json['status'] == 1 ? true : false,
        birthday = json['birthday'],
        isLock = json['is_lock'] == 1 ? true : false,
        job = json['job'],
        provinceId = int.parse(json['province_id']),
        districtId = int.parse(json['district_id']),
        workplace = json['workplace'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['workplace'] = workplace;
    data['birthday'] = null;

    // < 0 is placeholder
    data['province_id'] = provinceId! > 0 ? provinceId! : null;
    data['district_id'] = districtId! > 0 ? districtId! : null;
    data['gender'] = gender! >= 0 ? gender! : null;
    data['job'] = job! >= 0 ? job! : null;
    return data;
  }
}
