import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/views/home/dashboard_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/courses.dart';
import 'package:iloveyoucleanwater/views/learning/tab_bar_lessons.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,

        bottomNavigationBar: BottomNavigationBar(
          //unselectedItemColor: Colors.black,
          //selectedItemColor: Colors.redAccent,

          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang Chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.addressCard),
              label: 'Giới Thiệu',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.newspaper),
              label: 'Tin Tức',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.photoVideo),
              label: 'Thư Viện',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap),
              label: 'E-Learning',
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
              CourseView(),
            ],
          ),
        ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
