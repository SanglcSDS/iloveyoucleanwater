import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';

class IntroduceController extends GetxController {
  final HomeService homeService = HomeService();
  @override
  void onInit() async {
    await getCategory();
    await getListNewCategory();
    //  loadData();
    banners();
    getPopular();
    // lodingCategoryNew();
    super.onInit();
  }

  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;
  List<BannerModel> listBanner = [];
  var listPopular = List<BannerModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataErrer = false.obs;
  List<NewModel> listnews = [];
  RxList<CategoryNewsModel> listCategoryNewsModel = <CategoryNewsModel>[].obs;
  Future<void> getCategory() async {
    Response _data = await homeService.getCategoryNew();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      listCategory.add(CategoryModel(
          id: 0, language: "vi,", status: 1, title: 'home'.tr, referenceId: 1));
      if (jsonString != null) {
        jsonString.forEach((e) {
          listCategory.add(CategoryModel.fromJson(e));
        });
      }
    }
  }

  Future<void> getListNewCategory() async {
    for (int i = 1; i < listCategory.length; i++) {
      listnews.clear();
      await getNewsHome(listCategory[i].id, listCategory[i].title, i);
    }
  }

  Future<void> getNewsHome(int id, String title, int item) async {
    Response _data = await homeService.getNewsHome(id);
    List<NewModel> listNewModel = [];
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listNewModel.add(NewModel.fromJson(e));
        });

        listCategoryNewsModel.add(CategoryNewsModel(
            id: id, title: title, news: listNewModel, item: item));
      }
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var loading = true.obs;
  var isloading = true.obs;
  late TabController tabController;
  // loadData() async {
  //   try {
  //     getCategory();
  //     loadDatahistory();

  //     loading(true);
  //     tabController = TabController(
  //         vsync: this,
  //         length: listCategory.length,
  //         initialIndex: tabController.addListener(() {}));
  //     update();
  //   } finally {
  //     loading(false);
  //   }
  // }

  loadDatahistory() {
    try {
      Future.delayed(Duration(seconds: 2));
      isloading(true);
      update();
    } finally {
      isloading(false);
    }
  }

  void getPopular() async {
    try {
      isDataProcessing(true);
      Response<dynamic> _data = await homeService.getBanners();
      listBanner.clear();
      if (_data.statusCode == 200) {
        var jsonString = _data.body['data'];
        if (jsonString != null) {
          listPopular.clear();
          isDataProcessing(false);
          jsonString.forEach((e) {
            listPopular.add(BannerModel.fromJson(e));
          });
          isDataErrer(false);
        }
        onError:
        (err) {
          isDataProcessing(false);
          isDataErrer(true);
        };
      }
    } catch (e) {
      isDataProcessing(false);
      isDataErrer(true);
    }
  }

  void banners() async {
    try {
      update();
      Response<dynamic> _data = await homeService.getBanners();
      listBanner.clear();
      if (_data.statusCode == 200) {
        var jsonString = _data.body['data'];
        if (jsonString != null) {
          jsonString.forEach((e) {
            listBanner.add(BannerModel.fromJson(e));
          });
        }
      }
    } finally {
      update();
      print('data fetch done');
    }
  }
}
