import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_detail_model.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/service/introduce_service.dart';

class IntroduceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  IntroduceService service = IntroduceService();
  late TabController controller;
  late IntroduceModel introduceModel;
  RxList introduceProgram = <IntroduceDetialModel>[].obs;
  RxList introducePartner = <IntroduceDetialModel>[].obs;
  RxInt indexTap = 0.obs;
  @override
  void onInit() {
    super.onInit();

    //  GetIntroduces();
    isloadingIntroduce();
  }

  Future<void> isloadingIntroduce() async {
    if ('locales'.tr == "vi") {
      introduceProgram.clear();
      introducePartner.clear();
      GetDetialProgram(1);
      GetDetialPartner(3);
    } else {
      introduceProgram.clear();
      introducePartner.clear();
      GetDetialProgram(2);
      GetDetialPartner(4);
    }
  }

  void changeTabintroduce(int index) {
    controller.animateTo(index);
  }

  Future<void> GetDetialProgram(int id) async {
    Response _data = await service.GetDetailIntroduces(id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        introduceProgram.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  Future<void> GetDetialPartner(int id) async {
    Response _data = await service.GetDetailIntroduces(id);
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      if (jsonString != null) {
        introducePartner.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
