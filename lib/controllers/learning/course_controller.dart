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
import 'package:intl/intl.dart';

class CourseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogged = false.obs;
  RxList<Course> courses = <Course>[].obs;
  final GetStorage box = GetStorage();
  final LessonController _lessonController = Get.put(LessonController());
  final DocumentController _documentController = Get.put(DocumentController());

  @override
  void onInit() {
    initData();
    update();
    super.onInit();
  }

  Future<void> initData() async {
    checkLogged();
    if (isLogged.value) {
      final String response =
          await rootBundle.loadString('assets/json/data.json');
      final data = await json.decode(response);
      var courseJson = data["courses"] as List;
      courses = courseJson.map((e) => Course.fromJson(e)).toList().obs;
      update();
    }
  }

  void checkLogged() {
    try {
      if (box.hasData("token")) {
        String token = box.read("token");
        if (token.isNotEmpty) {
          DateTime expireDate =
              DateFormat('yyyy-MM-dd HH:mm:ss').parse(box.read("expiresAt"));
          if (DateTime.now().isBefore(expireDate)) {
            isLogged = true.obs;
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      update();
    }
  }

  void popToLessonViews(Course course) {
    _lessonController.onInitLesson(course.lessons!.obs);
    _documentController.documents = course.documents!.obs;
    update();
    Get.toNamed(Routes.LEARNING);
  }
}
