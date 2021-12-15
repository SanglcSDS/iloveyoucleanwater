import 'package:json_annotation/json_annotation.dart';
part 'news_link_model.g.dart';

@JsonSerializable()
class NewsLinkModel {
  String url;
  String label;
  bool active;

  NewsLinkModel({required this.url, required this.label, required this.active});

  factory NewsLinkModel.fromJson(Map<String, dynamic> json) =>
      _$NewsLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsLinkModelToJson(this);
}
