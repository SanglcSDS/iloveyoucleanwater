import 'package:json_annotation/json_annotation.dart';
part 'library_model.g.dart';

@JsonSerializable()
class LibraryModel {
  int id;
  String title;
  String description;
  String content;
  String image;
  int status;
  String language;
  int referenceId;
  String createdAt;

  LibraryModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.content,
      required this.image,
      required this.status,
      required this.language,
      required this.referenceId,
      required this.createdAt});

  factory LibraryModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryModelToJson(this);
}
