import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/evaluations_controller.dart';

class EvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EvaluationController>(EvaluationController());
  }
}
