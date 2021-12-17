import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/evaluation.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';

class EvaluationController extends GetxController {
  RxList<Evaluation>? evaluations;
  LearningService _learningService = Get.put(LearningService());
  Map<int, bool>? values;
  Map<int, String>? otherVals;
  // Map<String, dynamic>? result;
  @override
  void onInit() {
    // result = {};
    loadData();
    super.onInit();
  }

  void loadData() async {
    EasyLoading.show(status: 'loadingText'.tr);
    Response response = await _learningService.getEvaluation();
    if (response.statusCode == 200 && !response.body['error']) {
      var data = response.body['data'] as List;
      List<Evaluation> list = [];
      Map<int, bool> _item = {};
      Map<int, String> _otherItem = {};
      for (Map<String, dynamic> item in data) {
        list.add(Evaluation.fromJson(item));
        if (item['type'] == 2) {
          _item.addAll({item['id']: false});
          if (item['is_other'] == 2) _otherItem.addAll({item['id']: ''});
        }
      }

      evaluations = list.obs;
      values = _item.obs;
      update();
    }
    EasyLoading.dismiss();
  }
}
