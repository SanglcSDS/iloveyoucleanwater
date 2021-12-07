import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/course.dart';

class CourseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late RxBool isLogged;
  RxList<Course> courses = <Course>[].obs;

  @override
  void onInit() {
    readJson();
    isLogged = false.obs;
    super.onInit();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    var courseJson = data["courses"] as List;
    courses = courseJson.map((e) => Course.fromJson(e)).toList().obs;
    update();
  }
}
