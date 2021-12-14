import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';
import 'package:iloveyoucleanwater/models/library/library_model.dart';
import 'package:iloveyoucleanwater/service/library_service.dart';
import 'package:iloveyoucleanwater/views/library/library_detail_photo_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RefreshController refreshControllerPhoto =
      RefreshController(initialRefresh: true);
  final RefreshController refreshControllerVideo =
      RefreshController(initialRefresh: true);
  RxList listPhoto = <LibraryModel>[].obs;
  RxList listVideo = <LibraryModel>[].obs;
  Rx<LibraryDetailPhotoModel>? detailPhoto;
  final LibraryService libraryService = LibraryService();
  String titles = 'library'.tr;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'album'.tr,
      key: const Key('library1'),
    ),
    Tab(
      text: 'video'.tr,
      key: const Key('library2'),
    )
  ];

  late TabController controller;
  void oClickLibrary0() async {
    controller.animateTo(0);
  }

  void oClickLibrary1() async {
    controller.animateTo(1);
  }

  @override
  void onInit() {
    super.onInit();
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  int currentPagsV = 1;
  late int totalPagesV;
  Future<bool> getVideo({bool isLoadingV = false}) async {
    if (isLoadingV) {
      currentPagsV = 1;
    } else {
      if (currentPagsV > totalPagesV) {
        refreshControllerVideo.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await libraryService.getVideo(currentPagsV);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]["data"];

      if (jsonString != null) {
        if (isLoadingV) {
          listVideo.clear();
          jsonString.forEach((e) {
            listVideo.add(LibraryModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            listVideo.add(LibraryModel.fromJson(e));
          });
        }
        currentPagsV++;

        totalPagesV = _data.body['data']['last_page'];
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  int currentPagsP = 1;
  late int totalPagesP;
  Future<bool> getPhoto({bool isLoadingP = false}) async {
    if (isLoadingP) {
      currentPagsP = 1;
    } else {
      if (currentPagsP > totalPagesP) {
        refreshControllerPhoto.loadNoData();
        return false;
      }
    }

    Response<dynamic> _data = await libraryService.getPhoto(currentPagsP);
    if (_data.statusCode == 200) {
      var jsonString = _data.body["data"]['data'];

      if (jsonString != null) {
        if (isLoadingP) {
          listPhoto.clear();
          jsonString.forEach((e) {
            listPhoto.add(LibraryModel.fromJson(e));
          });
        } else {
          jsonString.forEach((e) {
            listPhoto.add(LibraryModel.fromJson(e));
          });
        }
        currentPagsP++;

        totalPagesP = _data.body['data']['last_page'];
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<void> getDetailPhotoHome(LibraryModel news) async {
    Response _data = await libraryService.getDetailPhoto(news.id);

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

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
