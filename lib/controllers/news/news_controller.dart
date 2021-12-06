import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeService provider = HomeService();
  var isLoading = false;
  var hasMore = true;
  List<NewModel> listNewModel = [];
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Tin tức chương trình',
    ),
    const Tab(text: 'Tin tức môi trường'),
  ];
  void news() async {
    try {
      isLoading = true;
      update();
      Response<dynamic> _data = await provider.getNews();
      listNewModel.clear();
      if (_data.statusCode == 200) {
        var jsonString = _data.body['data'];
        if (jsonString != null) {
          jsonString.forEach((e) {
            listNewModel.add(NewModel.fromJson(e));
          });
        }
      }
    } finally {
      isLoading = false;

      update();
      print('data fetch done');
    }
  }

  late TabController controller;
  void oClickTab0() async {
    controller.animateTo(0);
  }

  void oClickTab1() async {
    controller.animateTo(1);
  }

  @override
  void onInit() {
    super.onInit();
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
