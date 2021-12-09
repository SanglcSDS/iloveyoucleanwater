import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/models/learning/course.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';

class CourseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogged = false.obs;
  RxList<Course> courses = <Course>[].obs;
  final GetStorage box = GetStorage();
  final List<Color> colors = [
    Colors.grey,
    Color(Colors.blueGrey[200]!.value),
    Colors.blueAccent,
    Colors.lime,
    Color(Colors.green[200]!.value),
    Color(Colors.brown[300]!.value),
  ];
  final LessonController _lessonController = Get.put(LessonController());
  final DocumentController _documentController = Get.put(DocumentController());

  @override
  void onInit() {
    checkLogged();
    if (isLogged.value) {
      initData();
    }
    update();
    super.onInit();
  }

  Future<void> initData() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    var courseJson = data["courses"] as List;
    courses = courseJson.map((e) => Course.fromJson(e)).toList().obs;
    update();
  }

  void checkLogged() {
    try {
      if (box.hasData("token")) {
        String token = box.read("token");
        isLogged = token.isNotEmpty ? true.obs : false.obs;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      update();
    }
  }

  void setLogged() {
    isLogged = true.obs;
    debugPrint("isLogged: " + isLogged.value.toString());
    initData();
    update();
  }

  Color randomColor() {
    Random random = Random();
    int index = random.nextInt(colors.length);
    return colors[index];
  }

  void popToLessonViews(Course course) {
    _lessonController.onInitLesson(course.lessons!.obs);
    _documentController.documents = course.documents!.obs;
    update();
    Get.toNamed(Routes.LEARNING);
  }
}
