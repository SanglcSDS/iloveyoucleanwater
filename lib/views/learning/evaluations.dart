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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Column(
                children:
                    List.generate(controller.evaluations!.length, (index) {
                  if (controller.evaluations![index].type == 2) ansIndex++;
                  return _buildEvalution(
                      controller.evaluations![index], ansIndex);
                }),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(child: const SizedBox()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Theme(
                      data: ThemeData(primarySwatch: kPrimaryMaterial),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          'evaluation_btn'.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
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
                      onChanged: (String? value) {
                        if (value!.isBlank!) {
                          controller.values!
                              .update(evaluation.id, (value) => false);
                          controller.update();
                        } else {
                          controller.values!
                              .update(evaluation.id, (value) => true);
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
