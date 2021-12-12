import 'package:flutter/foundation.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';

class CategoryModel {
  int id;
  String title;
  int status;
  String language;
  int referenceId;
  int totalPages;
  int currentPage;

  int index;
  List<NewModel> news;

  CategoryModel({
    required this.id,
    required this.title,
    required this.status,
    required this.language,
    required this.referenceId,
    required this.totalPages,
    required this.currentPage,
    required this.news,
    required this.index,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] ?? '' as int,
        title: json['title'] ?? '',
        status: json['status'] ?? '' as int,
        language: json['language'] ?? '',
        referenceId: json['reference_id'] ?? '',
        totalPages: json['page'] ?? 1,
        currentPage: json['page'] ?? 1,
        news: json['news'] ?? [],
        index: json['index'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['language'] = this.language;
    data['reference_id'] = this.referenceId;
    return data;
  }
}
