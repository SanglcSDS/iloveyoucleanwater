import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/models/learning/course.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:intl/intl.dart';

class CourseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogged = false.obs;
  RxList<Course> courses = <Course>[].obs;
  final GetStorage box = GetStorage();
  final LessonController _lessonController = Get.put(LessonController());
  final DocumentController _documentController = Get.put(DocumentController());
  final LearningService _learningService = Get.put(LearningService());

  final List<String> dropletIcons = [
    "assets/images/giot-nuoc-1.png",
    "assets/images/giot-nuoc-2.png",
    "assets/images/giot-nuoc-3.png",
    "assets/images/giot-nuoc-4.png",
  ];

  @override
  void onInit() {
    initData();
    dropletIcons.shuffle();
    super.onInit();
  }

  Future<void> initData() async {
    checkLogged();
    if (isLogged.value) {
      Response<dynamic> response = await _learningService.getCourses();
      if (response.statusCode == 200) {
        Map<String, dynamic> body = response.body;
        if (body.containsKey("courses")) {
          var courseJson = body['courses'] as List;
          courses = courseJson.map((e) => Course.fromJson(e)).toList().obs;
        }
      }
      // else {
      //   Get.toNamed(Routes.LOGIN);
      // }
    }
    update();
  }

  String getDropletIcon(int index) {
    if (index < dropletIcons.length) {
      return dropletIcons[index];
    } else {
      return dropletIcons[index - dropletIcons.length];
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
    _lessonController.onInitLesson(course.id);
    _documentController.loadDocuments(course.id);
    update();
    Get.toNamed(Routes.LEARNING);
  }
}
