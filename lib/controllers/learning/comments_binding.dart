import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/comments_controller.dart';

class CommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CommentController>(CommentController());
  }
}
