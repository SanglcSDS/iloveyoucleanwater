import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/evaluations_controller.dart';
import 'package:iloveyoucleanwater/models/learning/evaluation.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class EvaluationView extends GetView<EvaluationController> {
  EvaluationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int ansIndex = 0;
    return GetBuilder<EvaluationController>(
      init: EvaluationController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'course_rate'.tr,
            style: TextStyle(color: primaryColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      controller.evaluations != null
                          ? Column(
                              children: List.generate(controller.evaluations!.length,
                                  (index) {
                                if (controller.evaluations![index].type == 2)
                                  ansIndex++;
                                return _buildEvalution(
                                    controller.evaluations![index], index);
                              }),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Theme(
                  data: ThemeData(primarySwatch: kPrimaryMaterial),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () => controller.sendEvaluation(context),
                    label: Text(
                      'evaluation_btn'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEvalution(Evaluation evaluation, int ansIndex) {
    return evaluation.type == 1
        ? Container(
            margin: const EdgeInsets.only(top: 16),
            alignment: Alignment.centerLeft,
            child: Text(evaluation.content!))
        : evaluation.isOther == 1
            ? Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: Checkbox(
                          value: controller.values![evaluation.id],
                          onChanged: (bool? newValue) {
                            controller.values!
                                .update(evaluation.id, (value) => newValue!);
                            controller.chooseAnswer(ansIndex, evaluation.id, newValue!);
                            controller.update();
                          }),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      evaluation.content!,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Theme(
                          data: ThemeData(primarySwatch: kPrimaryMaterial),
                          child: Checkbox(
                              value: controller.values![evaluation.id],
                              onChanged: (bool? newValue) {
                                controller.values!.update(
                                    evaluation.id, (value) => newValue!);
                                // controller.chooseOther(ansIndex, evaluation.id, newValue!, null);
                                controller.update();
                              }),
                        ),
                      ),
                      Expanded(
                        child: Text('evaluation_other'.tr),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: TextFormField(
                      initialValue: controller.otherVals![evaluation.id],
                      onChanged: (String? newVal) {
                        if (newVal!.isBlank!) {
                          // controller.chooseOther(ansIndex, evaluation.id, null, null);
                          controller.values!
                              .update(evaluation.id, (value) => false);
                          controller.otherVals!
                              .update(evaluation.id, (value) => "");
                          controller.update();
                        } else {
                          // controller.chooseOther(ansIndex, evaluation.id, null, value);
                          controller.values!
                              .update(evaluation.id, (value) => true);
                          controller.otherVals!
                              .update(evaluation.id, (value) => newVal);
                          controller.update();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "evaluation_other_input".tr,
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              );
  }
}
