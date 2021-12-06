import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Tin tức chương trình',
    ),
    const Tab(text: 'Tin tức môi trường'),
  ];

  late TabController controller;
  void oClickTab0() async {
    controller.animateTo(0);
  }

  void oClickTab1() async {
    controller.animateTo(1);
  }

  @override
  void onInit() {
    super.onInit();
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
