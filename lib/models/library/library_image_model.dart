import 'package:json_annotation/json_annotation.dart';

part 'library_image_model.g.dart';

@JsonSerializable()
class LibraryImageModel {
  String link;

  LibraryImageModel({required this.link});
  factory LibraryImageModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryImageModelToJson(this);
}
