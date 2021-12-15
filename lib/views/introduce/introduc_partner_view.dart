import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class IntroducePartnerNew extends StatelessWidget {
  final _Controller = Get.put(IntroduceController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _Controller.introducePartner.length,
      itemBuilder: (context, index) {
        var item = _Controller.introducePartner;
        return Obx(
          () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  Text(item[index].description,
                      style: kTitleCard.copyWith(fontSize: 18.0)),
                  const SizedBox(height: 15.0),
                  const SizedBox(height: 15.0),
                  SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Html(data: item[index].content),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0)
                ],
              )),
        );
      },
    );
  }
}
