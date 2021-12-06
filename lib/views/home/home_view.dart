import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/views/home/dashboard_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/learning_view.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,

        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.addressCard),
              label: 'introduce'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              label: 'news'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.photoVideo),
              label: 'library'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap),
              label: 'learning'.tr,
            ),
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              DashboardView(),
              IntroduceView(),
              NewsView(),
              LibraryView(),
              LearningView(),
            ],
          ),
        ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
