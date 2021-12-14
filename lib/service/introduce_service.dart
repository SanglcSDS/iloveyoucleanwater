import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class IntroduceService extends GetConnect {
  Future<Response> GetIntroduces() {
    return get("${Constants.SERVER_URL}/introduction/list?language=vi");
  }

  Future<Response> GetDetailIntroduces(int id) {
    return get("${Constants.SERVER_URL}/introduction/show?id=$id");
  }
}
