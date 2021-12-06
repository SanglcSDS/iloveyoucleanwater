// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airline _$AirlineFromJson(Map<String, dynamic> json) => Airline(
      id: json['id'] ?? '' as int,
      name: json['name'] ?? '' as String,
      country: json['country'] ?? '' as String,
      logo: json['logo'] ?? '' as String,
      slogan: json['slogan'] ?? '' as String,
      headQuaters: json['headQuaters'] ?? '' as String,
      website: json['website'] ?? '' as String,
      established: json['established'] ?? '' as String,
    );

Map<String, dynamic> _$AirlineToJson(Airline instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'slogan': instance.slogan,
      'headQuaters': instance.headQuaters,
      'website': instance.website,
      'established': instance.established,
    };
