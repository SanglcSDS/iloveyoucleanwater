import 'dart:convert';

import 'package:iloveyoucleanwater/views/home/slide/test/test2.dart';
import 'package:json_annotation/json_annotation.dart';
part 'test1.g.dart';

PassengersData passengersDataFromJson(String str) =>
    PassengersData.fromJson(json.decode(str));

String passengersDataToJson(PassengersData data) => json.encode(data.toJson());

@JsonSerializable()
class PassengersData {
  PassengersData({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  int totalPassengers;
  int totalPages;
  List<Passenger> data;

  factory PassengersData.fromJson(Map<String, dynamic> json) =>
      _$PassengersDataFromJson(json);

  Map<String, dynamic> toJson() => _$PassengersDataToJson(this);
}
