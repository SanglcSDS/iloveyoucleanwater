import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/dashboard_view.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';
import 'package:iloveyoucleanwater/views/news/detail_new_view.dart';
import 'package:iloveyoucleanwater/views/news/environmental_news_view.dart';
import 'package:iloveyoucleanwater/views/news/list_news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';
import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsView extends GetView<NewsController> {
  final HomeController homeController = Get.put(HomeController());
  final NewsController _newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleButton(
            colors: kGrey1,
            icon: Icons.arrow_back_ios,
            onTap: homeController.changeTabHome),
        title: const Text("Tin Tức", style: TextStyle(color: kGrey1)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Hero(
              tag: "ddd",
              child: Container(
                color: kGrey3,
                constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                  controller: _newsController.controller,
                  tabs: _newsController.myTabs,
                  labelColor: kGrey1,
                  labelPadding: const EdgeInsets.all(15),
                  indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.solid),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff339AFF),
                        Color(0xffCAE4FF),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _newsController.controller,
                  children: _newsController.myTabs.map((Tab tab) {
                    if (tab.key == const Key('news1')) {
                      return ListNewsView(tag: "new1");
                    } else {
                      return EnvironmentalNewsView(tag: "new2");
                    }
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
