import 'dart:convert';

import 'package:iloveyoucleanwater/models/news/news_link_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_page_model.g.dart';

NewsPageModel newsPageModelDataFromJson(String str) =>
    NewsPageModel.fromJson(json.decode(str));

@JsonSerializable()
class NewsPageModel {
  int currentPage;
  List<NewModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<NewsLinkModel> links;
  String nextPageUrl;
  String path;
  String perPage;
  String prevPageUrl;
  int to;
  int total;

  NewsPageModel(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.links,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});

  factory NewsPageModel.fromJson(Map<String, dynamic> json) =>
      _$NewsPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsPageModelToJson(this);
}
