// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
// import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
// import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
// import 'package:iloveyoucleanwater/models/news/category_model.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class NewsListView extends StatelessWidget {
//   final int index;
//   final int id;

//   NewsListView({required this.index, required this.id});
//   RefreshController refreshController =
//       new RefreshController(initialRefresh: true);

//   final _controller = Get.put(IntroduceController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Obx(() {
//         Widget getList() {
//           var list = _controller.listCategoryNewPage[index];

//           ListView myList = ListView.builder(
//             itemCount: list.news.length,
//             itemBuilder: (context, index) {
//               var recent = list.news[index];
//               return Hero(
//                 tag: "$index$index",
//                 child: InkWell(
//                   // onTap: () {
//                   //   _Homecontroller.getNewsDetailsModel(recent);
//                   // },
//                   child: Container(
//                     width: double.infinity,
//                     height: 135.0,
//                     margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: NewWidgetView(news: recent),
//                   ),
//                 ),
//               );
//             },
//           );
//           return myList;
//         }

//         return SmartRefresher(
//           controller: refreshController,
//           enablePullUp: true,
//           // footer: CustomFooter(
//           //   builder: (context, mode) {
//           //     if (mode == LoadStatus.idle) {
//           //       return Center(child: Text("pull up load"));
//           //     } else if (mode == LoadStatus.failed) {
//           //       return Center(child: Text("Load Failed!Click retry!"));
//           //     } else if (mode == LoadStatus.canLoading) {
//           //       return Center(child: Text("release to load more"));
//           //     } else {
//           //       return Center(child: Text("No more Data"));
//           //     }
//           //   },
//           // ),
//           onRefresh: () async {
//             final result = await _controller.getLoadMoreRefresh(true, id);

//             if (result) {
//               refreshController.refreshCompleted();
//             } else {
//               refreshController.refreshFailed();
//             }
//           },
//           onLoading: () async {
//             final result = await _controller.getLoadMoreRefresh(false, id);

//             if (result) {
//               refreshController.loadComplete();
//             } else {
//               var check = _controller.listCategoryNewPage[index];
//               if (check.currentPage > check.totalPages) {
//                 refreshController.loadNoData();
//               } else {
//                 refreshController.loadFailed();
//               }
//             }
//           },
//           child: getList(),
//         );
//       }),
//     );
//   }
// }
