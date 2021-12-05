import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';

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
                    final String label = tab.text!.toLowerCase();
                    return Center(
                      child: Text(
                        "sssss",
                        style: const TextStyle(fontSize: 36),
                      ),
                    );
                  }).toList(),
                  //   children: [

                  //   Container(
                  //     child: ListView.builder(
                  //       itemCount: recentList.length,
                  //       scrollDirection: Axis.vertical,
                  //       shrinkWrap: true,
                  //       physics: const ScrollPhysics(),
                  //       itemBuilder: (context, index) {
                  //         var recent = recentList[index];
                  //         return InkWell(
                  //           onTap: () =>
                  //               Get.to(() => ReadNewsView(news: recent)),
                  //           child: Container(
                  //             width: double.infinity,
                  //             height: 135.0,
                  //             margin: const EdgeInsets.symmetric(
                  //                 horizontal: 18.0),
                  //             child: SecondaryCard(news: recent),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
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
