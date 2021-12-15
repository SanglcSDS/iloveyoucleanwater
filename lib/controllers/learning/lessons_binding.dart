import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';

class LessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LessonController>(LessonController());
  }
}
