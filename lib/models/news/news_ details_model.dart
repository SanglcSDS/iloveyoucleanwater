import 'package:json_annotation/json_annotation.dart';
part 'news_ details_model.g.dart';

@JsonSerializable()
class NewsDetailsModel {
  int id;
  String title;
  String description;
  String content;
  String image;
  int view;
  String language;
  int referenceId;
  String createdAt;

  NewsDetailsModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.content,
      required this.image,
      required this.view,
      required this.language,
      required this.referenceId,
      required this.createdAt});

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailsModelToJson(this);
}
