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
    return Obx(
      () => ListView.builder(
        itemCount: _Controller.introduceProgram.length,
        itemBuilder: (context, index) {
          var item = _Controller.introduceProgram;
          // print(item[index].content.toString());
          // print("--------------------------------------------------");
          // print(pigLatinheight(pigLatinwidth(item[index].content.toString())));
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  Text(item[index].description,
                      textAlign: TextAlign.justify,
                      style: kTitleCard.copyWith(fontSize: 15.0)),
                  const SizedBox(height: 15.0),
                  SingleChildScrollView(
                    child: Html(
                      style: {
                        "p": Style(textAlign: TextAlign.justify),
                        "li": Style(textAlign: TextAlign.justify)
                      },
                      data: item[index].content,

                      // pigLatinheight(
                      //     pigLatinwidth(item[index].content.toString())),
                    ),
                  ),
                  const SizedBox(height: 25.0)
                ],
              ));
        },
      ),
    );
  }
}
