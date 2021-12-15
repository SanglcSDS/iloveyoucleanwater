import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/questions_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QuestionController>(QuestionController());
  }
}
