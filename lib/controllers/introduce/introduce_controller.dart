import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_detail_model.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/introduce_service.dart';

class IntroduceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  IntroduceService service = IntroduceService();
  late IntroduceModel introduceModel;
  RxList introduceProgram = <IntroduceDetialModel>[].obs;
  RxList introducePartner = <IntroduceDetialModel>[].obs;

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'introduceProgram'.tr,
      key: const Key("Program"),
    ),
    Tab(
      text: 'introducePartner'.tr,
      key: const Key('Partner'),
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    //  GetIntroduces();
    GetDetialProgram(1);
    GetDetialPartner(3);
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

//   Future<void> GetIntroduces() async {
//     Response _data = await service.GetIntroduces();
//     if (_data.statusCode == 200) {
//       var jsonString = _data.body['data'];
//       if (jsonString != null) {
// introduceDetialModel.add(value) = IntroduceModel.fromJson(jsonString[0]).obs;
//       }
//     }
//     update();
//   }

  Future<void> GetDetialProgram(int id) async {
    Response _data = await service.GetDetailIntroduces(id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      //  print(jsonString);
      if (jsonString != null) {
        introduceProgram.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  Future<void> GetDetialPartner(int id) async {
    Response _data = await service.GetDetailIntroduces(id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      //  print(jsonString);
      if (jsonString != null) {
        introducePartner.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  late TabController controller;

  @override
  void onClose() {
    controller.dispose();

    super.onClose();
  }
}
