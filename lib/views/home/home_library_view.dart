// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/service/news.dart';
// import 'package:iloveyoucleanwater/views/library/library_details_view.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';

// class HomeNewsView extends StatelessWidget {
//   final List<News> news;
//   HomeNewsView({required this.news});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300.0,
//       padding: const EdgeInsets.only(left: 10.0),
//       child: ListView.builder(
//         itemCount: popularList.length,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           var news = popularList[index];
//           return InkWell(
//             onTap: () => Get.to(() => DetailsLibraryView(news: news)),
//             child: Container(
//               margin: const EdgeInsets.only(right: 12.0, top: 5.0),
//               // child: PrimaryCard(news: news),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
