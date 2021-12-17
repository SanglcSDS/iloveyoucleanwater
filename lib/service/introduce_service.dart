import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class IntroduceService extends GetConnect {
  Future<Response> GetIntroduces() {
    return get(
        "${Constants.SERVER_URL}/introduction/list?language=${'locales'.tr}");
  }

  Future<Response> GetDetailIntroduces(int id) {
    return get("${Constants.SERVER_URL}/introduction/show?id=$id");
  }
}
