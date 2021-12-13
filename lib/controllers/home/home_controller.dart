import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';
import 'package:iloveyoucleanwater/models/library/library_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_%20details_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/home/home_detail_new_view.dart';
import 'package:iloveyoucleanwater/views/library/library_detail_photo_View.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_timer.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());

class HomeController extends GetxController {
  NewsService providerNewsService = NewsService();
  var isloadingHome = true.obs;
  var isLoading = false;
  final NewsService provider = NewsService();
  final HomeService homeService = HomeService();
  var tabIndex = 0;
  Rx<NewsDetailsModel>? detail;
  // RxList<CategoryModel> listCategoryNewPage = <CategoryModel>[].obs;
  RxList<CategoryNewsModel> listCategoryNewsModel = <CategoryNewsModel>[].obs;
  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;
  List<BannerModel> listBanner = [];
  RxList listPhoto = <LibraryModel>[].obs;
  RxList listVideo = <LibraryModel>[].obs;
  Rx<LibraryDetailPhotoModel>? detailPhoto;
  var listPopular = List<BannerModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataErrer = false.obs;

  @override
  void onInit() async {
    await getCategory();
    await getListNewCategory();

    getPopular();
    getPhotoHome();
    getVideoHome();

    super.onInit();
  }

  Future<bool> onRefreshHome({bool isRefresh = false}) async {
    isloadingHome(true);
    await Future.delayed(Duration(seconds: 2));
    update();
    await getCategory();
    await getListNewCategory();
    getPopular();
    getPhotoHome();
    getVideoHome();
    isloadingHome(false);
    update();
    return true;
  }

  Future<void> getCategory() async {
    Response _data = await homeService.getCategoryNew();

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data']['data'];
      if (jsonString != null) {
        jsonString.forEach((e) {
          listCategory.add(CategoryModel.fromJson(e));
        });
      }
    }
  }

  Future<void> getListNewCategory() async {
    listCategoryNewsModel.clear();
    listCategory.clear();
    for (int i = 0; i < listCategory.length; i++) {
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

  Future<void> getPhotoHome() async {
    listPhoto.clear();
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
    listVideo.clear();
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
