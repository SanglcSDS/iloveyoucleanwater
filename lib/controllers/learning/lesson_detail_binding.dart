import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lesson_detail_controller.dart';

class LessonDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LessonDetailController>(LessonDetailController());
  }
}
