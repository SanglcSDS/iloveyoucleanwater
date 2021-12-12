import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/home_Service.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';

class IntroduceController extends GetxController {
  // final HomeService homeService = HomeService();
  // @override
  // void onInit() async {
  //   await getCategory();
  //   await getListNewCategory();
  //   await getListCategory();

  //   getPopular();
  //   super.onInit();
  // }

  // RxList<CategoryModel> listCategoryNewPage = <CategoryModel>[].obs;
  // final NewsService providerNewsService = NewsService();
  // RxList<CategoryModel> listCategory = <CategoryModel>[].obs;

  // List<BannerModel> listBanner = [];
  // var listPopular = List<BannerModel>.empty(growable: true).obs;
  // var isDataProcessing = false.obs;
  // var isDataErrer = false.obs;

  // Future<bool> getLoadMoreRefresh(bool isLoading, int id) async {
  //   for (int i = 0; i < listCategoryNewPage.length; i++) {
  //     if (listCategoryNewPage[i].id == id) {
  //       if (isLoading) {
  //         listCategoryNewPage[i].currentPage = 1;
  //       }
  //       if (listCategoryNewPage[i].currentPage >
  //           listCategoryNewPage[i].totalPages) {
  //         return false;
  //       }
  //       Response<dynamic> _data = await providerNewsService.getNewAll(
  //           listCategoryNewPage[i].currentPage, id);
  //       if (_data.statusCode == 200) {
  //         var jsonString = _data.body["data"]['data'];

  //         if (jsonString != null) {
  //           if (isLoading) {
  //             listCategoryNewPage[i].news.clear();
  //             jsonString.forEach((e) {
  //               listCategoryNewPage[i].news.add(NewModel.fromJson(e));
  //             });
  //           } else {
  //             jsonString.forEach((e) {
  //               listCategoryNewPage[i].news.add(NewModel.fromJson(e));
  //             });
  //           }
  //           listCategoryNewPage[i].currentPage++;

  //           listCategoryNewPage[i].totalPages = _data.body['data']['last_page'];
  //         }
  //         update();
  //         return true;
  //       } else {
  //         update();
  //         return false;
  //       }
  //     }
  //   }
  //   return true;
  // }

  // RxList<CategoryNewsModel> listCategoryNewsModel = <CategoryNewsModel>[].obs;
  // Future<void> getCategory() async {
  //   Response _data = await homeService.getCategoryNew();

  //   if (_data.statusCode == 200) {
  //     var jsonString = _data.body['data']['data'];
  //     listCategory.add(CategoryModel(
  //         id: 0,
  //         language: "vi,",
  //         status: 1,
  //         title: 'home'.tr,
  //         referenceId: 1,
  //         currentPage: 1,
  //         totalPages: 1,
  //         news: [],
  //         index: 0));
  //     if (jsonString != null) {
  //       jsonString.forEach((e) {
  //         listCategory.add(CategoryModel.fromJson(e));
  //       });
  //     }
  //   }
  // }

  // Future<void> getListCategory() async {
  //   for (int i = 0; i < listCategory.length; i++) {
  //     await getProgramNew(
  //         listCategory[i].totalPages,
  //         listCategory[i].currentPage,
  //         listCategory[i].id,
  //         i,
  //         listCategory[i].title);
  //   }
  // }

  // Future<void> getProgramNew(
  //   int totalPages,
  //   int currentPage,
  //   int id,
  //   int index,
  //   String title,
  // ) async {
  //   Response<dynamic> _data =
  //       await providerNewsService.getNewAll(currentPage, id);
  //   if (_data.statusCode == 200) {
  //     List<NewModel> listNewModel = [];
  //     var jsonString = _data.body["data"]['data'];
  //     if (jsonString != null) {
  //       jsonString.forEach((e) {
  //         listNewModel.add(NewModel.fromJson(e));
  //       });
  //     }

  //     listCategoryNewPage.add(CategoryModel(
  //         id: id,
  //         totalPages: _data.body['data']['last_page'],
  //         currentPage: currentPage,
  //         index: index,
  //         title: title,
  //         news: listNewModel,
  //         language: '',
  //         referenceId: 0,
  //         status: 1));
  //   }
  // }

  // Future<void> getListNewCategory() async {
  //   for (int i = 1; i < listCategory.length; i++) {
  //     await getNewsHome(listCategory[i].id, listCategory[i].title, i);
  //   }
  // }

  // Future<void> getNewsHome(int id, String title, int item) async {
  //   Response _data = await homeService.getNewsHome(id);
  //   List<NewModel> listNewModel = [];
  //   if (_data.statusCode == 200) {
  //     var jsonString = _data.body['data']['data'];
  //     if (jsonString != null) {
  //       jsonString.forEach((e) {
  //         listNewModel.add(NewModel.fromJson(e));
  //       });

  //       listCategoryNewsModel.add(CategoryNewsModel(
  //           id: id, title: title, news: listNewModel, item: item));
  //     }
  //   }
  // }

  // void getPopular() async {
  //   try {
  //     isDataProcessing(true);
  //     Response<dynamic> _data = await homeService.getBanners();
  //     listBanner.clear();
  //     if (_data.statusCode == 200) {
  //       var jsonString = _data.body['data'];
  //       if (jsonString != null) {
  //         listPopular.clear();
  //         isDataProcessing(false);
  //         jsonString.forEach((e) {
  //           listPopular.add(BannerModel.fromJson(e));
  //         });
  //         isDataErrer(false);
  //       }
  //       onError:
  //       (err) {
  //         isDataProcessing(false);
  //         isDataErrer(true);
  //       };
  //     }
  //   } catch (e) {
  //     isDataProcessing(false);
  //     isDataErrer(true);
  //   }
  // }

}
