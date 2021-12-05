import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LibraryController>(LibraryController());
  }
}
