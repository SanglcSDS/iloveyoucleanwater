import 'package:json_annotation/json_annotation.dart';

part 'library_video_model.g.dart';

@JsonSerializable()
class LibraryVideoModel {
  int id;
  String title;
  String image;
  String linkVideo;
  int view;
  String language;
  int referenceId;

  LibraryVideoModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.linkVideo,
      required this.view,
      required this.language,
      required this.referenceId});
  factory LibraryVideoModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryVideoModelToJson(this);
}
