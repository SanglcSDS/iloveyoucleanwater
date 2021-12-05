import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/learning_controller.dart';

class LearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LearningController>(LearningController());
  }
}
