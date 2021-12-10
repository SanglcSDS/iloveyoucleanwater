import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:iloveyoucleanwater/service/news_service.dart';

class LearningController extends GetxController {
  final NewsService provider = NewsService();
}
