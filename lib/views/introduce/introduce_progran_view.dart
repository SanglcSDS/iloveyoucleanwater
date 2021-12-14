import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_detail_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class IntroduceProgramNew extends StatelessWidget {
  final _Controller = Get.put(IntroduceController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _Controller.introduceDetialModel.length,
      itemBuilder: (context, index) {
        var item = _Controller.introduceDetialModel;
        return Obx(
          () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  Text(item[index].description,
                      style: kTitleCard.copyWith(fontSize: 20.0)),
                  const SizedBox(height: 15.0),
                  const SizedBox(height: 15.0),
                  // SingleChildScrollView(
                  //   child: Html(
                  //     data: item[index].content,
                  //   ),
                  // ),
                  const SizedBox(height: 25.0)
                ],
              )),
        );
      },
    );
  }
}
