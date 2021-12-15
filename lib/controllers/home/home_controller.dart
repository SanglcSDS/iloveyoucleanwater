import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';
import 'package:iloveyoucleanwater/models/library/library_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_%20details_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/introduce_service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/home/home_detail_new_view.dart';
import 'package:iloveyoucleanwater/views/library/library_detail_photo_view.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());

class HomeController extends GetxController {
  NewsService providerNewsService = NewsService();
  IntroduceService service = IntroduceService();

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
  late Rx<IntroduceModel> introduceModel;
  var listPopular = List<BannerModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataErrer = false.obs;

  @override
  void onInit() async {
    isloadingHome(true);
    await Future.delayed(Duration(seconds: 2));
    await getCategory();
    await getListNewCategory();
    GetIntroduces();
    getPopular();
    getPhotoHome();
    getVideoHome();
    isloadingHome(false);
    update();

    super.onInit();
  }

  Future<bool> onRefreshHome({bool isRefresh = false}) async {
    listCategoryNewsModel.clear();
    listCategory.clear();
    isloadingHome(true);
    await Future.delayed(Duration(seconds: 2));

    await getCategory();
    await getListNewCategory();
    GetIntroduces();
    getPopular();
    getPhotoHome();
    getVideoHome();
    isloadingHome(false);
    update();
    return true;
  }

  Future<void> GetIntroduces() async {
    Response _data = await service.GetIntroduces();
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        introduceModel = IntroduceModel.fromJson(jsonString[0]).obs;
      }
    }
    update();
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

    Get.to(() => LibraryDetailPhotoView(
          news: detailPhoto!.value,
          title: 'album'.tr,
          datetime: news.createdAt,
        ));
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
