import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseController>(CourseController());
  }
}
