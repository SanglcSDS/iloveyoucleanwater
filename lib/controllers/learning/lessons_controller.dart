import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';

class LessonController extends GetxController {
  late String title;
  RxBool isComplete = false.obs;
  RxDouble? percent;
  RxString? percentStr;
  RxList<Lesson>? lessons;

  @override
  void onInit() {
    // title = course.title;
    isComplete = true.obs;
    percent = 0.5.obs;
    percentStr = '50% Hoàn thành'.obs;
    setPortrait();
    super.onInit();
  }

  Future setPortrait() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    update();
  }
}
