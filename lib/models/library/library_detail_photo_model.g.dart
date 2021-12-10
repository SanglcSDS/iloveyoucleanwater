// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_detail_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryDetailPhotoModel _$LibraryDetailPhotoModelFromJson(
        Map<String, dynamic> json) =>
    LibraryDetailPhotoModel(
      id: json['id'] ?? "" as int,
      title: json['title'] ?? "" as String,
      image: json['image'] ?? "" as String,
      content: json['content'] ?? "" as String,
      view: json['view'] ?? 0 as int,
      language: json['language'] as String,
      referenceId: json['reference_id'] ?? 0 as int,
      listImages: (json['list_images'] as List<dynamic>)
          .map((e) => LibraryImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LibraryDetailPhotoModelToJson(
        LibraryDetailPhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'content': instance.content,
      'view': instance.view,
      'language': instance.language,
      'reference_id': instance.referenceId,
      'list_images': instance.listImages,
    };
