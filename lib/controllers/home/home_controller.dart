import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/NewsDemo.dart';
import 'package:iloveyoucleanwater/models/home/NewsDemoModell.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/home/carousel.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());

class HomeController extends GetxController {
  final RefreshController refreshHomeController =
      RefreshController(initialRefresh: true);
  var isloadingHome = false.obs;
  var isLoading = false;
  final NewsService provider = NewsService();
  final HomeService homeService = HomeService();
  var tabIndex = 0;

  List<News> news = [];
  RxList listCarousel = <Carousel>[].obs;
  List<BannerModel> listBanner = [];
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
    loadingHome();

    super.onInit();
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
