import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String titles = "Thư Viện";
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Thư viện ảnh',
    ),
    const Tab(text: 'Thư viện video'),
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

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
