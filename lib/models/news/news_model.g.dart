// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewModel _$NewModelFromJson(Map<String, dynamic> json) => NewModel(
      id: json['id'] ?? "" as int,
      title: json['title'] ?? "" as String,
      language: json['language'] ?? "" as String,
      status: json['status'] ?? "" as int,
      image: json['image'] ?? "" as String,
      description: json['description'] ?? "" as String,
      createdAt: json['created_at'] ?? "" as String,
      categoryTitle: json['category_title'] ?? "" as String,
    );

Map<String, dynamic> _$NewModelToJson(NewModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'language': instance.language,
      'status': instance.status,
      'image': instance.image,
      'description': instance.description,
      'created_at': instance.createdAt,
      'category_title': instance.categoryTitle,
    };
