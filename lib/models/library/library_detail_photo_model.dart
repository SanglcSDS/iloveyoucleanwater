import 'package:iloveyoucleanwater/models/library/library_image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'library_detail_photo_model.g.dart';

@JsonSerializable()
class LibraryDetailPhotoModel {
  int id;
  String title;
  String image;
  String content;
  int view;
  String language;
  int referenceId;
  List<LibraryImageModel> listImages;

  LibraryDetailPhotoModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.content,
      required this.view,
      required this.language,
      required this.referenceId,
      required this.listImages});
  factory LibraryDetailPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryDetailPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryDetailPhotoModelToJson(this);
}
