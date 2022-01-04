import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/evaluation.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:dio/src/response.dart' as dio_resp;
import 'package:iloveyoucleanwater/utils/constants.dart';

class EvaluationController extends GetxController {
  RxList<Evaluation>? evaluations;
  LearningService _learningService = Get.put(LearningService());
  Map<int, bool>? values;
  Map<int, String>? otherVals;
  RxMap<String, dynamic> result = <String, dynamic>{}.obs;
  @override
  void onInit() {
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
      otherVals = _otherItem;
      update();
    }
    EasyLoading.dismiss();
  }

  void chooseAnswer(int index, int id, bool newVal) {
    if (result.containsKey(index.toString())) {
      result.remove(index.toString());
    }
    if (newVal) {
      result.putIfAbsent(index.toString(),
          () => {"\"id\"": id, "\"content\"": null}.toString());
    }
    update();
  }

  void sendEvaluation(BuildContext context) async {
    EasyLoading.show(status: "evaluation_send_loading".tr);
    otherVals!.removeWhere((int id, String value) => value.isBlank!);
    for (var key in otherVals!.keys) {
      result.addAll({
        key.toString(): {
          "\"id\"": key,
          "\"content\"": "\"" + otherVals![key].toString() + "\""
        }.toString()
      });
    }
    dio_resp.Response response = await _learningService.postEvaluation(result);
    if (response.statusCode == 200 && !response.data['error']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('evaluation_send_success'.tr),
          backgroundColor: primaryColor,
        ),
      );
      Get.offNamed(Routes.HOME);
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
