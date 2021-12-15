// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryModel _$LibraryModelFromJson(Map<String, dynamic> json) => LibraryModel(
      id: json['id'] ?? 0 as int,
      title: json['title'] ?? "" as String,
      description: json['description'] ?? "" as String,
      content: json['content'] ?? "" as String,
      image: json['image'] ?? "" as String,
      status: json['status'] ?? 0 as int,
      language: json['language'] ?? "" as String,
      referenceId: json['reference_id'] ?? 0 as int,
      createdAt: json['created_at'] ?? "" as String,
    );

Map<String, dynamic> _$LibraryModelToJson(LibraryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'image': instance.image,
      'status': instance.status,
      'language': instance.language,
      'reference_id': instance.referenceId,
      'created_at': instance.createdAt,
    };
