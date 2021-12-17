import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class NewsService extends GetConnect {
  Future<Response> getNewAll(int page, int id) {
    return get(
        "${Constants.SERVER_URL}/posts/list?pageLength=5&language=${'locales'.tr}&page=$page&categoryId=$id");
  }
}
