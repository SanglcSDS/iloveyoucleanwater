import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class LibraryService extends GetConnect {
  Future<Response> getVideo(int page) {
    return get(
        "${Constants.SERVER_URL}/videos/list?pageLength=5&language=${'locales'.tr}&page=$page");
  }

  Future<Response> getPhoto(int page) {
    return get(
        "${Constants.SERVER_URL}/photos/list?pageLength=5&language=${'locales'.tr}&page=$page");
  }

  Future<Response> getDetailVideo(int id) {
    return get("${Constants.SERVER_URL}/videos/show?id=$id");
  }

  Future<Response> getDetailPhoto(int id) {
    return get("${Constants.SERVER_URL}/photos/show?id=$id");
  }
}
