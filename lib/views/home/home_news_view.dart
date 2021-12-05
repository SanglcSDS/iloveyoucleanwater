import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/read_news_view.dart';

class HomeNewsView extends StatelessWidget {
  final List<News> news;
  HomeNewsView({required this.news});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          var recent = news[index];
          return Hero(
            tag: "TTCT$index",
            child: InkWell(
              onTap: () {
                Get.to(() => ReadNewsView(news: recent));
              },
              child: Container(
                width: double.infinity,
                height: 135.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: NewWidgetView(news: recent),
              ),
            ),
          );
        },
      ),
    );
  }
}
