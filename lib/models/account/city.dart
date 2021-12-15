class Province {
  int id;
  String name;

  Province({
    required this.id,
    required this.name,
  });

  Province.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class District {
  int id;
  String name;
  int provinceId;

  District({
    required this.id,
    required this.name,
    required this.provinceId,
  });

  District.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        provinceId = int.parse(json['province_id']);
}
