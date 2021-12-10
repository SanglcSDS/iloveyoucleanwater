import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  final RefreshController refreshControllerTab =
      RefreshController(initialRefresh: true);
  final HomeService provider = HomeService();
  final NewsService providerNewsService = NewsService();
  RxList listProgramNew = <NewModel>[].obs;
  RxList listEnvironmentalNews = <NewModel>[].obs;
  List<CategoryModel> listCategory = [];

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'programNews'.tr,
      key: const Key('news1'),
    ),
    Tab(text: 'environmentalNews'.tr, key: const Key('news2')),
  ];

  @override
  void onInit() {
    super.onInit();
    getCategory();
    getProgramNew(isRefresh: true);
    getEnvironmentalNews(isLoading: true);
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  Future<void> getCategory() async {
    Response _data = await provider.getCategoryNew();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listCategory.add(CategoryModel.fromJson(e));
        });
      }
    }
  }

  int currentPageP = 1;
  late int totalPagesP;
  Future<bool> getProgramNew({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPageP = 1;
    } else {
      if (currentPageP > totalPagesP) {
        refreshController.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await providerNewsService.getNewAll(
        currentPageP, listCategory.length > 0 ? listCategory[1].id : 10);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]['data'];

      if (jsonString != null) {
        if (isRefresh) {
          listProgramNew.clear();
          jsonString.forEach((e) {
            listProgramNew.add(NewModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            listProgramNew.add(NewModel.fromJson(e));
          });
        }
        currentPageP++;

        totalPagesP = _data.body['data']['last_page'];
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
  Future<bool> getEnvironmentalNews({bool isLoading = false}) async {
    if (isLoading) {
      currentPageE = 1;
    } else {
      if (currentPageE > totalPagesE) {
        refreshControllerTab.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await providerNewsService.getNewAll(
        currentPageE, listCategory.length > 0 ? listCategory[0].id : 10);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]['data'];

      if (jsonString != null) {
        if (isLoading) {
          listEnvironmentalNews.clear();
          jsonString.forEach((e) {
            listEnvironmentalNews.add(NewModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            listEnvironmentalNews.add(NewModel.fromJson(e));
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
