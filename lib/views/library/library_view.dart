import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/library/library_tabbar_view.dart';

class LibraryView extends GetView<LibraryController> {
  final HomeController homeController = Get.put(HomeController());
  final LibraryController _tabx = Get.put(LibraryController());
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
              child: Text('library'.tr, style: TextStyle(color: kGrey1)),
            ),
          )
        ],
        body: LibraryTabBarView(),
      ),
    );
  }
}
