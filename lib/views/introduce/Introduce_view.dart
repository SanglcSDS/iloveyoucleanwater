import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/introduce/introduc_partner_view.dart';
import 'package:iloveyoucleanwater/views/introduce/introduce_progran_view.dart';

class IntroduceView extends GetView<IntroduceController> {
  final introduceController = Get.put(IntroduceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, idex) => [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Container(
              child:
                  Text('introduce'.tr, style: TextStyle(color: primaryColor)),
            ),
          )
        ],
        body: DefaultTabController(
            length: 2,
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
                    controller: introduceController.controller,
                    tabs: introduceController.myTabs,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      controller: introduceController.controller,
                      children: introduceController.myTabs.map((Tab tab) {
                        if (tab.key == const Key("Program")) {
                          return IntroduceProgramNew();
                        } else {
                          return IntroducePartnerNew();
                        }
                      }).toList(),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
