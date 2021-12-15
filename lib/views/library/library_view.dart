import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/library/library_photo_view.dart';
import 'package:iloveyoucleanwater/views/library/library_video_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';

class LibraryView extends GetView<LibraryController> {
  final HomeController homeController = Get.put(HomeController());
  final LibraryController _tabx = Get.put(LibraryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleButton(
            colors: kGrey1,
            icon: Icons.arrow_back_ios,
            onTap: homeController.changeTabHome),
        title: Text(_tabx.titles, style: TextStyle(color: kGrey1)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              color: kGrey3,
              constraints: const BoxConstraints.expand(height: 50),
              child: TabBar(
                controller: _tabx.controller,
                tabs: _tabx.myTabs,
                labelColor: kGrey1,
                labelPadding: const EdgeInsets.all(15),
                indicator: const ShapeDecoration(
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                        style: BorderStyle.solid),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff339AFF),
                      Color(0xffCAE4FF),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _tabx.controller,

                  children: _tabx.myTabs.map((Tab tab) {
                    if (tab.key == const Key('library1')) {
                      return LibraryPhotoView(tag: "library1");
                    } else {
                      return LibraryVideoView(tag: "library2");
                    }
                  }).toList(),
                  //   children: [

                  // ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
