import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class HomeService extends GetConnect {
  Future<Response> getNewDetail(int id) {
    return get("${Constants.SERVER_URL}/posts/show?language=vi&id=$id");
  }

  Future<Response> getVideoHome() {
    return get(
        "${Constants.SERVER_URL}/videos/list?pageLength=4&language=vi&page=1");
  }

  Future<Response> getPhotoHome() {
    return get(
        "${Constants.SERVER_URL}/photos/list?pageLength=4&language=vi&page=1");
  }

  Future<Response> getDetailVideoHome(int id) {
    return get("${Constants.SERVER_URL}/videos/show?id=$id");
  }

  Future<Response> getDetailPhotoHome(int id) {
    return get("${Constants.SERVER_URL}/photos/show?id=$id");
  }

  Future<Response> getCategoryNew() {
    return get(
        "${Constants.SERVER_URL}/categories/list?pageLength=5&language=vi&page=1");
  }

  Future<Response> getNewsHome(int id) {
    return get(
        "${Constants.SERVER_URL}/posts/list?pageLength=5&language=vi&page=1&categoryId=$id");
  }

  Future<Response> getBanners() {
    return get(
        "${Constants.SERVER_URL}/banners/list?pageLength=5&language=en&page=1");
  }

  Future<Response> getNews() {
    return get(
        "${Constants.SERVER_URL}/posts/list?pageLength=5&language=vi&page=1&categoryId=");
  }
}
