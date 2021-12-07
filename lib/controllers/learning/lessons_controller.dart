import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/course.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';

class LessonController extends GetxController {
  Course course = Course(title: 'Giới thiệu chung về khóa học E-learning');
  List<Document> documents = [
    Document(
        type: 'pdf',
        title:
            'Tài liệu Hướng dẫn dạy và học về tiết kiệm và bảo vệ nước',
        url:
            'https://mizuiku-emyeunuocsach.vn/storage/library/2020/01/JhhRxYETLSZ1ozq5dhmGuezgP524HSBsLbIMqfOE.pdf',
        fileName: 'JhhRxYETLSZ1ozq5dhmGuezgP524HSBsLbIMqfOE.pdf')
  ];
  List<Lesson> items = [
    Lesson(
        title: 'Tổng quan về khóa học trực tuyến "Mizuiku - Em yêu nước sạch"',
        time: '2:52',
        totalStudent: 22,
        unlocked: true,
        url: 'https://www.youtube.com/watch?v=eTp6En_eqHk'),
    Lesson(
        title: 'Giới thiệu phương pháp giáo dục tích cực (phần 1)',
        time: '6:31',
        totalStudent: 18,
        unlocked: true,
        url: 'https://www.youtube.com/watch?v=LDmLkSBh2Kc'),
    Lesson(
        title: 'Giới thiệu phương pháp giáo dục tích cực (phần cuối)',
        time: '12:57',
        totalStudent: 15,
        unlocked: false,
        url: 'https://www.youtube.com/watch?v=kSYt95u4Dms'),
    Lesson(
        title: 'Tài liệu Hướng dẫn dạy và học về tiết kiệm và bảo vệ nước',
        time: '1:18',
        totalStudent: 15,
        unlocked: false,
        url: 'https://www.youtube.com/watch?v=cF_Yj21ZqEw'),
  ];
  late String title;
  bool isComplete = false;

  @override
  void onInit() {
    title = course.title;
    isComplete = false;
    setPortrait();
    super.onInit();
  }

  Future setPortrait() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    update();
  }
}
