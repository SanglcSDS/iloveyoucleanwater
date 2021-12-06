import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DocumentController>(DocumentController());
  }
}
