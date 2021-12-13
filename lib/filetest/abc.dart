// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> with SingleTickerProviderStateMixin {
//   final _controller = Get.put(IntroduceController());
//   late PageController _pageController;
//   late TabController _tabController;
//   List<String> _tabList = ["A", "B", "C"];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabList.length, vsync: this);
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TabBar(
//           labelColor: Colors.blue,
//           controller: _tabController,
//           tabs:
          
//            _controller.listCategoryNewPage.map((text) {
//             if (text.id == 0) {
//               return Tab(
//                 child: Row(
//                   children: [
//                     const Icon(Icons.home),
//                     const SizedBox(width: 5),
//                     Text(text.title)
//                   ],
//                 ),
//               );
//             } else {
//               return Tab(
//                 text: text.title,
//               );
//             }
//           }).toList(),
//           onTap: (index) {
//             _pageController.jumpToPage(index);
//           },
//         ),
//         Expanded(
//           child: FixTabBarView(
//             dragStartBehavior: DragStartBehavior.start,
//             pageController: _pageController,
//             tabController: _tabController,
//             children: _tabList.map((text) {
//               return Page(tab: text);
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

