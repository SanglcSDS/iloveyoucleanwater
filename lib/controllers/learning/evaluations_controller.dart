import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/evaluation.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';

class EvaluationController extends GetxController {
  List<Evaluation>? evaluations;
  LearningService _learningService = Get.put(LearningService());
  Map<int, bool>? values;
  Map<int, String>? otherVals;
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
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

      evaluations = list;
      values = _item.obs;
      update();
    }
  }
}
