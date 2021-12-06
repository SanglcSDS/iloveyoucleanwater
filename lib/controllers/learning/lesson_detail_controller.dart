import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';

class LessonDetailController extends GetxController {
  late int indexActive;
  Lesson lesson = Lesson(
      title: 'Tổng quan về khóa học trực tuyến "Mizuiku - Em yêu nước sạch"',
      time: '2:52',
      totalStudent: 22,
      unlocked: true,
      url: 'https://www.youtube.com/watch?v=eTp6En_eqHk');

  List<Lesson> lessonRelates = [];
  late Lesson currentLesson;

  @override
  void onInit() {
    super.onInit();
  }

  // updateList(List<Lesson> list) {
  //   lessonRelates = list;
  //   update();
  // }
}
