import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  final RefreshController refreshControllerTab =
      RefreshController(initialRefresh: true);
  final HomeService provider = HomeService();
  final NewsService providerNewsService = NewsService();

  List<NewModel> listNewModel = [];
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Tin tức chương trình',
      key: Key('news1'),
    ),
    const Tab(text: 'Tin tức môi trường', key: Key('news2')),
  ];

  @override
  void onInit() {
    super.onInit();
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
    getPassengerData(isRefresh: true);
  }

  int currentPage = 1;
  late int totalPages;
  RxList passengers = <NewModel>[].obs;

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await providerNewsService.getNewAll(currentPage);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]['data'];

      if (jsonString != null) {
        if (isRefresh) {
          passengers.clear();
          jsonString.forEach((e) {
            passengers.add(NewModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            passengers.add(NewModel.fromJson(e));
          });
        }
        currentPage++;

        totalPages = _data.body['data']['last_page'];
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  int currentPageE = 1;
  late int totalPagesE;
  RxList environmentalNews = <NewModel>[].obs;

  Future<bool> getEnvironmentalNews({bool isLoading = false}) async {
    if (isLoading) {
      currentPageE = 1;
    } else {
      if (currentPageE >= totalPagesE) {
        refreshControllerTab.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await providerNewsService.getNewAll(currentPage);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]['data'];

      if (jsonString != null) {
        if (isLoading) {
          environmentalNews.clear();
          jsonString.forEach((e) {
            environmentalNews.add(NewModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            environmentalNews.add(NewModel.fromJson(e));
          });
        }
        currentPageE++;

        totalPagesE = _data.body['data']['last_page'];
      }
      update();
      return true;
    } else {
      update();
      return false;
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
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
