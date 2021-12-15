// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryVideoModel _$LibraryVideoModelFromJson(Map<String, dynamic> json) =>
    LibraryVideoModel(
      id: json['id'] ?? 0 as int,
      title: json['title'] ?? "" as String,
      image: json['image'] ?? "" as String,
      linkVideo: json['link_video'] ?? "" as String,
      view: json['view'] ?? 0 as int,
      language: json['language'] ?? "" as String,
      referenceId: json['reference_id'] ?? 0 as int,
    );

Map<String, dynamic> _$LibraryVideoModelToJson(LibraryVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'linkVideo': instance.linkVideo,
      'view': instance.view,
      'language': instance.language,
      'referenceId': instance.referenceId,
    };
