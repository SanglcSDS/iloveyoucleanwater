// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
// import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class HomePage extends StatelessWidget {
//   final controller = Get.put(NewsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Infinite List Pagination"),
//       ),
//       body: Obx(
//         () => SmartRefresher(
//           controller: controller.refreshController,
//           enablePullUp: true,
//           onRefresh: () async {
//             final result = await controller.getPassengerData(isRefresh: true);
//             if (result) {
//               controller.refreshController.refreshCompleted();
//             } else {
//               controller.refreshController.refreshFailed();
//             }
//           },
//           onLoading: () async {
//             final result = await controller.getPassengerData();
//             if (result) {
//               controller.refreshController.loadComplete();
//             } else {
//               controller.refreshController.loadFailed();
//             }
//           },
//           child: ListView.builder(
//             itemBuilder: (context, index) {
//               final passenger = controller.passengers[index];

//               return ListTile(
//                 title: Text(passenger.categoryTitle,
//                     style: TextStyle(color: Colors.black)),
//                 subtitle: Text(passenger.title,
//                     style: TextStyle(color: Colors.black)),
//                 trailing: Text(
//                   "dđ",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             },
//             itemCount: controller.passengers.length,
//           ),
//         ),
//       ),
//     );
//   }
// }
