// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengersData _$PassengersDataFromJson(Map<String, dynamic> json) =>
    PassengersData(
      totalPassengers: json['totalPassengers'] as int,
      totalPages: json['totalPages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassengersDataToJson(PassengersData instance) =>
    <String, dynamic>{
      'totalPassengers': instance.totalPassengers,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };
