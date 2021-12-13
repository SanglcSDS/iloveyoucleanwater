// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
// import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
// import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class NewsProgram extends StatelessWidget {
//   final String tag;
//   NewsProgram({required this.tag});
//   final _Homecontroller = Get.put(HomeController());
//   final _controller = Get.put(NewsController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Obx(
//         () => SmartRefresher(
//           controller: _controller.refreshController,
//           enablePullUp: true,
//           onRefresh: () async {
//             final result = await _controller.getProgramNew(isRefresh: true);
//             if (result) {
//               _controller.refreshController.refreshCompleted();
//             } else {
//               _controller.refreshController.refreshFailed();
//             }
//           },
//           onLoading: () async {
//             final result = await _controller.getProgramNew();
//             if (result) {
//               _controller.refreshController.loadComplete();
//             } else {
//               _controller.refreshController.loadFailed();
//             }
//           },
//           child: ListView.builder(
//             itemCount: _controller.listProgramNew.length,
//             itemBuilder: (context, index) {
//               var recent = _controller.listProgramNew[index];
//               return Hero(
//                 tag: "$tag$index",
//                 child: InkWell(
//                   onTap: () {
//                     _Homecontroller.getNewsDetailsModel(recent);
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     height: 135.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: NewWidgetView(news: recent),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
