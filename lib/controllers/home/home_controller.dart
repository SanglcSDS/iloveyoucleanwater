import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';
import 'package:iloveyoucleanwater/models/library/library_model.dart';
import 'package:iloveyoucleanwater/models/library/library_video_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_%20details_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/introduce_service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';
import 'package:iloveyoucleanwater/views/home/home_detail_new_view.dart';
import 'package:iloveyoucleanwater/views/home/home_tabbar_view.dart';
import 'package:iloveyoucleanwater/views/library/library_detail_photo_view.dart';
import 'package:iloveyoucleanwater/views/library/library_details_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/hom_item_video_widget_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final controllerNews = Get.put(NewsController());
final controllerLibrary = Get.put(LibraryController());
final controllerIntroduce = Get.put(IntroduceController());
final courseController = Get.put(CourseController());

class HomeController extends GetxController {
  NewsService providerNewsService = NewsService();
  IntroduceService service = IntroduceService();

  var isloadingHome = true.obs;
  var isLoading = false;
  final NewsService provider = NewsService();
  final HomeService homeService = HomeService();
  var tabIndex = 0;

  ///Rx<NewsDetailsModel>? detail;
  // RxList<CategoryModel> listCategoryNewPage = <CategoryModel>[].obs;
  RxList<CategoryNewsModel> listCategoryNewsModel = <CategoryNewsModel>[].obs;
  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;
  List<BannerModel> listBanner = [];
  RxList listPhoto = <LibraryModel>[].obs;
  RxList listVideo = <LibraryModel>[].obs;
  var listIntroduce = <IntroduceModel>[].obs;
  late YoutubePlayerController video;
  late LibraryVideoModel detail;
  Rx<LibraryDetailPhotoModel>? detailPhoto;
  var listPopular = List<BannerModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataErrer = false.obs;
  // Rx<YoutubePlayerController>? videoController;
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
    listPopular.clear();
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
    controllerNews.isloadingNews();
    controllerLibrary.isLoadingLibrary();
    controllerIntroduce.isloadingIntroduce();

    courseController.initData();
    isloadingHome(false);
    update();
    return true;
  }

  // void onInitLesson(String currentUrl) {
  //   videoController = YoutubePlayerController(
  //     initialVideoId: YoutubePlayer.convertUrlToId(currentUrl)!,
  //     flags: const YoutubePlayerFlags(
  //       controlsVisibleAtStart: true,
  //       autoPlay: false,
  //     ),
  //   ).obs;
  // }

  Future<void> getDetailVideo(LibraryModel news) async {
    Response _data = await homeService.getDetailVideoHome(news.id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detail = LibraryVideoModel.fromJson(jsonString);

        video = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(detail.linkVideo)!,
          flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            autoPlay: true,
          ),
        );
        update();
        Get.to(() => ItemVideoWidgetView());
      }
    }
  }

  void changeVideo(LibraryModel news) async {
    Response _data = await homeService.getDetailVideoHome(news.id);
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detail = LibraryVideoModel.fromJson(jsonString);

        video.load(YoutubePlayer.convertUrlToId(detail.linkVideo)!);
        update();
      }
    }
  }
  // Future<void> getDetailVideo1(LibraryModel news) async {
  //   late LibraryVideoModel detail;
  //   late YoutubePlayerController video;
  //   Response _data = await homeService.getDetailVideoHome(news.id);

  //   if (_data.statusCode == 200) {
  //     var jsonString = _data.body['data'];
  //     if (jsonString != null) {
  //       detail = LibraryVideoModel.fromJson(jsonString);

  //       video = YoutubePlayerController(
  //         initialVideoId: YoutubePlayer.convertUrlToId(detail.linkVideo)!,
  //         flags: const YoutubePlayerFlags(
  //           controlsVisibleAtStart: true,
  //           autoPlay: true,
  //         ),
  //       );
  //       Get.to(
  //           () => ItemVideoView(LibraryVideo: detail, videoController: video));
  //     }
  //   }
  // }

  Future<void> GetIntroduces() async {
    List<IntroduceModel> list = [];
    Response _data = await service.GetIntroduces();
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        listIntroduce.clear();
        jsonString.forEach((e) {
          list.add(IntroduceModel.fromJson(e));
        });
        list.forEach((e) {
          if (e.id == 1 || e.id == 2) {
            listIntroduce.add(e);
          }
        });
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
    late LibraryDetailPhotoModel detail;
    Response _data = await homeService.getDetailPhotoHome(news.id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detail = LibraryDetailPhotoModel.fromJson(jsonString);
        Get.to(() => LibraryDetailPhotoView(
              news: detail,
              title: 'album'.tr,
              datetime: news.createdAt,
            ));
      }
    }
  }

  Future<void> getNewsDetailsModel(NewModel news, int index) async {
    Response _data = await homeService.getNewDetail(news.id);
    late NewsDetailsModel detail;
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        detail = NewsDetailsModel.fromJson(jsonString);
        print(detail.content);
        Get.to(() => HomeDetailNewsView(
              news: detail,
              title: news.categoryTitle,
              index: index,
            ));
      }
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void changeTabLibrary(int index, int index1) {
    tabIndex = index;
    controllerLibrary.changeTabLibrary(index1);
    update();
  }

  void changeTabLibraryDetail(int index, int index1) {
    Get.back();
    tabIndex = index;
    controllerLibrary.changeTabLibrary(index1);
    update();
  }

  void changeTabIntroduce(int index, int index1) {
    tabIndex = index;
    controllerIntroduce.changeTabintroduce(index1);
    update();
  }

  void changeTabNews(int index, int index1) {
    tabIndex = index;
    controllerNews.changeTabNews(index1);
    update();
  }

  void changeTabNewsDetail(
    int index,
  ) {
    Get.back();
    tabIndex = 1;
    controllerNews.changeTabNews(index);
    update();
  }

  void changeTabHome() {
    tabIndex = 0;
    update();
  }
}
