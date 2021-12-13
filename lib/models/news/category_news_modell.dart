import 'package:flutter/foundation.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';

class CategoryNewsModel {
  int id;
  int item;
  String title;
  List<NewModel> news;

  CategoryNewsModel(
      {required this.id,
      required this.title,
      required this.news,
      required this.item});
}
