import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/NewsDemo.dart';
import 'package:iloveyoucleanwater/models/home/NewsDemoModell.dart';
import 'package:iloveyoucleanwater/models/home/carousel.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());

class HomeController extends GetxController {
  var isloadingHome = false.obs;
  var isLoading = false;
  final NewsService provider = NewsService();
  var tabIndex = 0;

  List<News> news = [];
  RxList listCarousel = <Carousel>[].obs;
  List<Carousel> carouselData = [];
  List<NewDemo> newsDemo = [];
  // final serialFormKey = GlobalKey<FormState>();
  // final serialController = TextEditingController();

  @override
  void onInit() {
    loadingHome();
    fetchCarousel();

    super.onInit();
  }

  Future<void> fetchCarousel() async {
    try {
      isLoading = true;

      update();
      Response<dynamic> _data = await provider.GetAll();
      carouselData.clear();
      if (_data.statusCode == 200) {
        var jsonString = _data.body;
        if (jsonString != null) {
          jsonString.forEach((e) {
            carouselData.add(Carousel.fromJson(e));
          });
        }
      }
    } finally {
      isLoading = false;

      update();
      print('data fetch done');
    }
  }

  void loadingHome() async {
    try {
      isloadingHome(true);
      update();
      fetchCarousel();

      news = recentList;
    } finally {
      isloadingHome(false);
      update();
    }
  }

  void getNews() async {
    try {
      isLoading = true;
      update();
      Response<dynamic> _data = await provider.GetNews();
      if (_data.statusCode == 200) {
        var jsonString = _data.body["articles"];
        if (jsonString != null) {
          jsonString.forEach((e) {
            newsDemo.add(NewDemo.fromJson(e));
          });
        }
      }
    } finally {
      isLoading = false;
      update();
      print('data fetch done');
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
