import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';

class NewsController extends GetxController {
  final HomeService provider = HomeService();
  final NewsService providerNewsService = NewsService();

  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  Future<bool> getLoadMoreRefresh(bool isLoading, int id) async {
    for (int i = 0; i < listCategory.length; i++) {
      if (listCategory[i].id == id) {
        if (isLoading) {
          listCategory[i].currentPage = 1;
        }
        if (listCategory[i].currentPage > listCategory[i].totalPages) {
          return false;
        }
        Response<dynamic> _data = await providerNewsService.getNewAll(
            listCategory[i].currentPage, id);
        if (_data.statusCode == 200) {
          var jsonString = _data.body["data"]['data'];

          if (jsonString != null) {
            if (isLoading) {
              listCategory[i].news.clear();
              jsonString.forEach((e) {
                listCategory[i].news.add(NewModel.fromJson(e));
              });
            } else {
              jsonString.forEach((e) {
                listCategory[i].news.add(NewModel.fromJson(e));
              });
            }
            listCategory[i].currentPage++;

            listCategory[i].totalPages = _data.body['data']['last_page'];
          }
          update();
          return true;
        } else {
          update();
          return false;
        }
      }
    }
    return true;
  }

  Future<void> getCategory() async {
    Response _data = await provider.getCategoryNew();
    listCategory.clear();
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listCategory.add(CategoryModel.fromJson(e));
        });
      }
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
