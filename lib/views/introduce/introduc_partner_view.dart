import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class IntroducePartnerNew extends StatelessWidget {
  final _Controller = Get.put(IntroduceController());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            Text('partner'.tr, style: kTitleCard.copyWith(fontSize: 18.0)),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/log-1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/log-2.png',
                  // width: 600.0,
                  // height: 240.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/log-3.png',
                  // width: 600.0,
                  // height: 240.0,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/log-4.png',
                  // width: 600.0,
                  // height: 240.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text('educationalPartner'.tr,
                style: kTitleCard.copyWith(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/log-5.png',
                  // width: 600.0,
                  // height: 240.0,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/log-6.png',
                  // width: 600.0,
                  // height: 240.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 25.0)
          ],
        ));
  }
}
