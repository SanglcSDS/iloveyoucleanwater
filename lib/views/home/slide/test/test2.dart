import 'dart:convert';

import 'package:iloveyoucleanwater/views/home/slide/test/test3.dart';
import 'package:json_annotation/json_annotation.dart';
part 'test2.g.dart';

@JsonSerializable()
class Passenger {
  Passenger({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  String id;
  String name;
  int trips;
  List<Airline> airline;
  int v;

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
