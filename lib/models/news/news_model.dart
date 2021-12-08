import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewModel {
  int id;
  String title;
  String language;
  int status;
  String image;
  String description;
  String createdAt;
  String categoryTitle;

  NewModel(
      {required this.id,
      required this.title,
      required this.language,
      required this.status,
      required this.image,
      required this.description,
      required this.createdAt,
      required this.categoryTitle});

  factory NewModel.fromJson(Map<String, dynamic> json) =>
      _$NewModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewModelToJson(this);
}
