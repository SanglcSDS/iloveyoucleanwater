import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'test3.g.dart';

@JsonSerializable()
class Airline {
  Airline({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
  });

  int id;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineToJson(this);
}
