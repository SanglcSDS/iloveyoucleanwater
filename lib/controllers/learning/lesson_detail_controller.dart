import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LessonDetailController extends GetxController {
  @override
  void onInit() {
    setLandscape();
    super.onInit();
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  Future setPortrait() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
