// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_ details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailsModel _$NewsDetailsModelFromJson(Map<String, dynamic> json) =>
    NewsDetailsModel(
      id: json['id'] ?? "" as int,
      title: json['title'] ?? "" as String,
      language: json['language'] ?? "" as String,
      view: json['view'] ?? "" as int,
      referenceId: json['view'] ?? "" as int,
      image: json['image'] ?? "" as String,
      description: json['description'] ?? "" as String,
      createdAt: json['created_at'] ?? "" as String,
      content: json['content'] ?? "" as String,
    );

Map<String, dynamic> _$NewsDetailsModelToJson(NewsDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'language': instance.language,
      'view': instance.view,
      'referenceId': instance.referenceId,
      'image': instance.image,
      'description': instance.description,
      'created_at': instance.createdAt,
      'content': instance.content,
    };
