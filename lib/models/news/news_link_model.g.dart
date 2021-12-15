// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsLinkModel _$NewsLinkModelFromJson(Map<String, dynamic> json) =>
    NewsLinkModel(
      url: json['url'] as String,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$NewsLinkModelToJson(NewsLinkModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
