import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/views/home/dashboard_view.dart';
import 'package:iloveyoucleanwater/views/home/home_tab_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/courses.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';

class HomeTabBarView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,

        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: const Icon(Icons.home),
            //   label: 'home'.tr,
            // ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.newspaper),
              label: 'news'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.addressCard),
              label: 'introduce'.tr,
            ),

            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.photoVideo),
              label: 'library'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.graduationCap),
              label: 'learning'.tr,
            ),
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeTabView(),
              //  DashboardView(),
              IntroduceView(),
              LibraryView(),
              CourseView(),
            ],
          ),
        ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
