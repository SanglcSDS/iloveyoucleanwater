import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/introduce/introduc_partner_view.dart';
import 'package:iloveyoucleanwater/views/introduce/introduce_progran_view.dart';

class IntroduceTabNew extends StatefulWidget {
  @override
  _IntroduceTabNewState createState() => _IntroduceTabNewState();
}

class _IntroduceTabNewState extends State<IntroduceTabNew>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final _controller = Get.put(IntroduceController());

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: kGrey3,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(height: 50),
            child: TabBar(
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontStyle: FontStyle.normal,
              ),
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: kGrey1,
              isScrollable: true,
              controller: controller,
              tabs: <Widget>[
                Tab(text: 'introduceProgram'.tr),
                Tab(text: 'introducePartner'.tr),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  IntroduceProgramNew(),
                  IntroducePartnerNew(),
                ],
              ),
            ),
          ),
        ],
      ),
      length: 2,
    );
  }
}
