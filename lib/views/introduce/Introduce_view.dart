import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/home_loading_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';
import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';

class IntroduceView extends GetView<IntroduceController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              leading: CircleButton(
                  colors: kGrey1,
                  icon: Icons.arrow_back_ios,
                  onTap: () => Get.back()),
              title: const Text("Giới Thiệu", style: TextStyle(color: kGrey1)),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: HomeLoadingView()

            //  DefaultTabController(
            //   length: 2,
            //   child: Column(
            //     children: <Widget>[
            //       Container(
            //         color: kGrey3,
            //         constraints: const BoxConstraints.expand(height: 50),
            //         child: TabBar(
            //           tabs: [
            //             Row(children: const [
            //               Text("Tin tức chương trình",
            //                   style: TextStyle(color: kGrey1))
            //             ]),
            //             Row(children: const [
            //               Text("Giới thiệu đối tác",
            //                   style: TextStyle(color: kGrey1))
            //             ]),
            //           ],
            //           labelPadding: const EdgeInsets.all(15),
            //           indicator: const ShapeDecoration(
            //             shape: UnderlineInputBorder(
            //                 borderSide: BorderSide(
            //                     color: Colors.transparent,
            //                     width: 0,
            //                     style: BorderStyle.solid)),
            //             gradient: LinearGradient(
            //               colors: [Color(0xff339AFF), Color(0xffCAE4FF)],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           child: TabBarView(children: [
            //             Container(
            //               child: ListView.builder(
            //                 itemCount: recentList.length,
            //                 scrollDirection: Axis.vertical,
            //                 shrinkWrap: true,
            //                 physics: const ScrollPhysics(),
            //                 itemBuilder: (context, index) {
            //                   var recent = recentList[index];
            //                   return InkWell(
            //                     onTap: () =>
            //                         Get.to(() => ReadNewsView(news: recent)),
            //                     child: Container(
            //                       width: double.infinity,
            //                       height: 135.0,
            //                       margin: const EdgeInsets.symmetric(
            //                           horizontal: 18.0),
            //                       child: NewWidgetView(news: recent),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //             Container(
            //               child: ListView.builder(
            //                 itemCount: recentList.length,
            //                 scrollDirection: Axis.vertical,
            //                 shrinkWrap: true,
            //                 physics: const ScrollPhysics(),
            //                 itemBuilder: (context, index) {
            //                   var recent = recentList[index];
            //                   return InkWell(
            //                     onTap: () =>
            //                         Get.to(() => ReadNewsView(news: recent)),
            //                     child: Container(
            //                       width: double.infinity,
            //                       height: 135.0,
            //                       margin: const EdgeInsets.symmetric(
            //                           horizontal: 18.0),
            //                       child: NewWidgetView(news: recent),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //           ]),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            ));
  }
}
