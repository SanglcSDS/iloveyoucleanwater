// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
// import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
// import 'package:iloveyoucleanwater/service/news.dart';
// import 'package:iloveyoucleanwater/views/home/banner_home_view.dart';
// ;
// import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
// import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/title_widget_view.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class HomeLoadingView extends StatelessWidget {
//   final _controller = Get.put(HomeController());
//   final controller = Get.put(NewsController());
//   @override
//   Widget build(BuildContext context) {
//     return Text("data");

//     // Container(
//     //   child: SmartRefresher(
//     //     controller: _controller.refreshHomeController,
//     //     onRefresh: () async {
//     //       final result = await _controller.onRefreshHome(isRefresh: true);
//     //       if (result) {
//     //         _controller.refreshHomeController.refreshCompleted();
//     //       } else {
//     //         _controller.refreshHomeController.refreshFailed();
//     //       }
//     //     },
//     //     onLoading: () async {
//     //       final result = await _controller.onRefreshHome();
//     //       if (result) {
//     //         _controller.refreshHomeController.loadComplete();
//     //       } else {
//     //         _controller.refreshHomeController.loadFailed();
//     //       }
//     //     },
//     //     child: ListView(
//     //       children: <Widget>[
//     //         Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: <Widget>[
//     //             Container(child: GetBuilder<HomeController>(
//     //               builder: (_c) {
//     //                 if (_c.isLoading) if (_c.listBanner.length > 0)
//     //                   return CarouselSliderView(_c.listBanner);
//     //                 else
//     //                   return CarouselLoadingView();
//     //                 else if (_c.listBanner.length > 0)
//     //                   return CarouselSliderView(_c.listBanner);
//     //                 else
//     //                   return CarouselLoadingView();
//     //               },
//     //             )),
//     //             BannerHomeView(),
//     //             TitleWidgetView(
//     //                 title: 'news'.tr.toUpperCase(),
//     //                 onPressed: _controller.oClickNews0),
//     //             ListView.builder(
//     //               itemCount: controller.passengers.length,
//     //               // scrollDirection: Axis.vertical,
//     //               shrinkWrap: true,
//     //               itemBuilder: (context, index) {
//     //                 var recent = controller.passengers[index];
//     //                 return Hero(
//     //                   tag: "TTCT$index",
//     //                   child: InkWell(
//     //                     onTap: () {
//     //                       //  Get.to(() => ReadNewsView(news: recent));
//     //                     },
//     //                     child: Container(
//     //                       width: double.infinity,
//     //                       height: 135.0,
//     //                       margin: const EdgeInsets.symmetric(horizontal: 10.0),
//     //                       child: NewWidgetView(news: recent),
//     //                     ),
//     //                   ),
//     //                 );
//     //               },
//     //             ),
//     //           ],
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
