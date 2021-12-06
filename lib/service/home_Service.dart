import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class HomeService extends GetConnect {
  Future<Response> getBanners() {
    return get(
        "${Constants.SERVER_URL}/banners/list?pageLength=5&language=en&page=1");
  }

  Future<Response> getNews() {
    return get(
        "${Constants.SERVER_URL}/posts/list?pageLength=5&language=vi&page=1&categoryId=");
  }
}
