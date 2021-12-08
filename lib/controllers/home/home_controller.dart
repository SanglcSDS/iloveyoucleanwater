import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';
import 'package:iloveyoucleanwater/models/library/library_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/news_%20details_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/home/home_detail_new_view.dart';
import 'package:iloveyoucleanwater/views/library/library_detail_photo_View.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());

class HomeController extends GetxController {
  final RefreshController refreshHomeController =
      RefreshController(initialRefresh: true);
  var isloadingHome = false.obs;
  var isLoading = false;
  final NewsService provider = NewsService();
  final HomeService homeService = Get.put(HomeService());
  var tabIndex = 0;
  Rx<NewsDetailsModel>? detail;

  List<News> news = [];
  RxList listProgramNew = <NewModel>[].obs;
  RxList listEnvironmentalNews = <NewModel>[].obs;

  List<BannerModel> listBanner = [];
  List<CategoryModel> listCategory = [];
  RxList listPhoto = <LibraryModel>[].obs;
  RxList listVideo = <LibraryModel>[].obs;
  Rx<LibraryDetailPhotoModel>? detailPhoto;
  RxList onRefreshlistBanner = <BannerModel>[].obs;
  Future<bool> onRefreshHome({bool isRefresh = false}) async {
    Response<dynamic> _data = await homeService.getBanners();
    onRefreshlistBanner.clear();
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          onRefreshlistBanner.add(BannerModel.fromJson(e));
        });
      }
      return true;
    } else {
      return true;
    }
  }

  @override
  void onInit() {
    getCategory();
    getPhotoHome();
    getVideoHome();

    super.onInit();
  }

  void getNewsHomes() async {
    await getNewsHome(listCategory[0].id, listProgramNew);
    await getNewsHome(listCategory[1].id, listEnvironmentalNews);
  }

  Future<void> getNewsHome(int id, RxList list) async {
    Response _data = await homeService.getNewsHome(id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          list.add(NewModel.fromJson(e));
        });
      }
    }
  }

  Future<void> getPhotoHome() async {
    Response _data = await homeService.getPhotoHome();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listPhoto.add(LibraryModel.fromJson(e));
        });
      }
    }
  }

  Future<void> getVideoHome() async {
    Response _data = await homeService.getVideoHome();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listVideo.add(LibraryModel.fromJson(e));
        });
      }
    }
  }

  Future<void> getCategory() async {
    Response _data = await homeService.getCategoryNew();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listCategory.add(CategoryModel.fromJson(e));
        });
        getNewsHomes();
      }
    }
  }

  Future<void> getDetailPhotoHome(LibraryModel news) async {
    Response _data = await homeService.getDetailPhotoHome(news.id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detailPhoto = LibraryDetailPhotoModel.fromJson(jsonString).obs;
      }
    }
// LibraryDetailPhotoView
    Get.to(() =>
        LibraryDetailPhotoView(news: detailPhoto!.value, title: 'album'.tr));
  }

  Future<void> getNewsDetailsModel(NewModel news) async {
    Response _data = await homeService.getNewDetail(news.id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detail = NewsDetailsModel.fromJson(jsonString).obs;
      }
    }

    Get.to(() =>
        HomeDetailNewsView(news: detail!.value, title: news.categoryTitle));
  }

  void banners() async {
    try {
      isLoading = true;
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
      isLoading = false;

      update();
      print('data fetch done');
    }
  }

  void loadlanguage(String language) async {
    try {
      String a = language;
      isloadingHome(true);
      banners();
      update();

      news = recentList;
    } finally {
      isloadingHome(false);
      update();
    }
  }

  void loadingHome() async {
    try {
      isloadingHome(true);
      update();
      banners();

      news = recentList;
    } finally {
      isloadingHome(false);
      update();
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void changeTabHome() {
    tabIndex = 0;
    update();
  }

  void oClickNews1() {
    tabIndex = 2;
    controllerNews.oClickTab1();
    update();
  }

  void oClickNews0() {
    tabIndex = 2;
    controllerNews.oClickTab0();
    update();
  }

  void oClickLibrary1() {
    tabIndex = 3;
    controllerLibrary.oClickLibrary1();
    update();
  }

  void oClickLibrary0() {
    tabIndex = 3;
    controllerLibrary.oClickLibrary0();
    update();
  }
}
