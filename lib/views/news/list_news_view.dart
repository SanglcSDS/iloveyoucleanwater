// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:iloveyoucleanwater/models/home/carousel.dart';
// import 'package:iloveyoucleanwater/models/home/newsDemo.dart';
// import 'package:iloveyoucleanwater/utils/constants.dart';
// import 'package:iloveyoucleanwater/views/news/detail_new_view.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
// import 'package:iloveyoucleanwater/views/shared/widgets/read_news_view.dart';

// class ListNewsView extends StatefulWidget {
//   final List<NewDemo> carouselList;
//   const ListNewsView(this.carouselList);

//   @override
//   _ListNewsViewState createState() => _ListNewsViewState();
// }

// class _ListNewsViewState extends State<ListNewsView> {
//   int _current = 0;
//   late List<Widget> imageSlider;

//   @override
//   void initState() {
//     imageSlider = widget.carouselList
//         .map((e) => Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               decoration: const BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     width: 1.0,
//                     color: kGrey3,
//                   ),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 90.0,
//                     height: 135.0,
//                     child: CachedNetworkImage(
//                       imageUrl: e.urlToImage,
//                       errorWidget: (context, url, error) =>
//                           const Icon(Icons.error),
//                       progressIndicatorBuilder:
//                           (context, url, downloadProgress) => Center(
//                         child: CircularProgressIndicator(
//                           value: downloadProgress.progress,
//                         ),
//                       ),
//                       fit: BoxFit.cover,
//                       width: 1000,
//                     ),
//                   ),
//                   const SizedBox(width: 12.0),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             e.title,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             style: kTitleCard,
//                           ),
//                           const SizedBox(height: 4.0),
//                           Text(
//                             e.title,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             style: kDetailContent,
//                           ),
//                           const Spacer(),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(e.description,
//                                     style: kDetailContent,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1),
//                               ),
//                               const SizedBox(width: 10.0),
//                               const CircleAvatar(
//                                 radius: 5.0,
//                                 backgroundColor: kGrey1,
//                               ),
//                               const SizedBox(width: 10.0),
//                               Expanded(
//                                 child: Text(e.publishedAt,
//                                     style: kDetailContent,
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ))
//         .toList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: widget.carouselList.map((e) {
//         int index = widget.carouselList.indexOf(e);
//         return Hero(
//           tag: "TTCT$index",
//           child: InkWell(
//             onTap: () {
//               Get.to(() => DetailNewsView(news: e));
//             },
//             child: Container(
//               width: double.infinity,
//               height: 135.0,
//               margin: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: NewWidgetView(news: e),
//             ),
//           ),
//         );
//       }).toList(),
//     );

//     //  ListView.builder(
//     //   itemCount: ,
//     //   scrollDirection: Axis.vertical,
//     //   shrinkWrap: true,
//     //   physics: ScrollPhysics(),
//     //   itemBuilder: (context, index) {
//     //     var recent = recentList[index];
//     //     return Hero(
//     //       tag: "TTCT$index",
//     //       child: InkWell(
//     //         onTap: () {
//     //           Get.to(() => ReadNewsView(news: recent));
//     //         },
//     //         child: Container(
//     //           width: double.infinity,
//     //           height: 135.0,
//     //           margin: const EdgeInsets.symmetric(horizontal: 10.0),
//     //           child: NewWidgetView(news: recent),
//     //         ),
//     //       ),
//     //     );
//     //   },
//     // );
//   }
// }
// //   @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     child: Column(
//   //       children: [
//   //         CarouselSlider(
//   //             items: imageSlider,
//   //             options: CarouselOptions(
//   //                 autoPlay: true,
//   //                 enlargeCenterPage: true,
//   //                 aspectRatio: 16 / 9,
//   //                 viewportFraction: 1,
//   //                 onPageChanged: (index, reason) {
//   //                   setState(() {
//   //                     _current = index;
//   //                   });
//   //                 })),
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: widget.carouselList.map((e) {
//   //             int index = widget.carouselList.indexOf(e);
//   //             return Container(
//   //               width: 7,
//   //               height: 7,
//   //               margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
//   //               decoration: BoxDecoration(
//   //                 shape: BoxShape.circle,
//   //                 color: _current == index ? kGrey3 : kBlue1,
//   //               ),
//   //             );
//   //           }).toList(),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }
// // }
