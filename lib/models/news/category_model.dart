import 'package:flutter/foundation.dart';

class CategoryModel {
  int id;
  String title;
  int status;
  String language;
  int referenceId;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.status,
      required this.language,
      required this.referenceId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] ?? '' as int,
        title: json['title'] ?? '',
        status: json['status'] ?? '' as int,
        language: json['language'] ?? '',
        referenceId: json['reference_id'] ?? '',
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
