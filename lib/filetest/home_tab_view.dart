// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
// import 'package:iloveyoucleanwater/models/news/category_model.dart';
// import 'package:iloveyoucleanwater/utils/constants.dart';
// import 'package:iloveyoucleanwater/views/introduce/news_list_view.dart';
// import 'package:iloveyoucleanwater/views/introduce/test.dart';
// import 'package:iloveyoucleanwater/views/news/news_view.dart';

// class HomeTabView extends StatefulWidget {
//   @override
//   __HomeTabViewState createState() => __HomeTabViewState();
// }

// class __HomeTabViewState extends State<HomeTabView>
//     with SingleTickerProviderStateMixin {
//   late PageController _pageController;
//   final _controller = Get.put(IntroduceController());
//   late TabController _controllerTab;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controllerTab = TabController(
//         length: _controller.listCategoryNewPage.length, vsync: this);
//     _pageController = PageController();
//     _controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controllerTab.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         floatHeaderSlivers: true,
//         headerSliverBuilder: (context, idex) => [
//           SliverAppBar(
//             pinned: true,
//             floating: true,
//             snap: true,
//             backgroundColor: Colors.white,
//             centerTitle: true,
//             title: Container(
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 fit: BoxFit.cover,
//                 width: MediaQuery.of(context).size.width * 0.55,
//               ),
//             ),
//             actions: <Widget>[
//               IconButton(
//                 icon: const Icon(Icons.settings, color: kGrey1),
//                 onPressed: () => Get.to(NewsView()),
//               ),
//             ],
//             bottom: TabBar(
//               indicatorColor: Colors.blue,
//               labelColor: Colors.blue,
//               unselectedLabelColor: kGrey1,
//               controller: _controllerTab,
//               isScrollable: true,
//               tabs: _controller.listCategoryNewPage.map((text) {
//                 if (text.id == 0) {
//                   return Tab(
//                     child: Row(
//                       children: [
//                         const Icon(Icons.home),
//                         const SizedBox(width: 5),
//                         Text(text.title)
//                       ],
//                     ),
//                   );
//                 } else {
//                   return Tab(
//                     text: text.title,
//                   );
//                 }
//               }).toList(),
//               onTap: (index) {
//                 _pageController.jumpToPage(index);
//               },
//             ),
//           )
//         ],
//         body: TabBarView(
//           controller: _controllerTab,
//           children: _controller.listCategoryNewPage.map((text) {
//             return Page(
//               tab: text,
//               controllerTab: _controllerTab,
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class Page extends StatefulWidget {
//   final CategoryModel tab;
//   final TabController controllerTab;
//   Page({required this.tab, required this.controllerTab});

//   @override
//   _PageState createState() =>
//       _PageState(tab: tab, controllerTab: controllerTab);
// }

// class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
//   CategoryModel tab;
//   TabController controllerTab;
//   _PageState({required this.tab, required this.controllerTab});
//   @override
//   void didUpdateWidget(Page oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);

//     return tab.id == 0
//         ? HomSildeView(
//             animaTeto: controllerTab,
//           )
//         : NewsListView(
//             index: tab.index,
//             id: tab.id,
//           );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// // class FixTabBarView extends StatefulWidget {
// //   const FixTabBarView({
// //     required this.children,
// //     required this.tabController,
// //     required this.pageController,
// //     this.dragStartBehavior = DragStartBehavior.start,
// //   })  : assert(children != null),
// //         assert(dragStartBehavior != null);
// //   final TabController tabController;
// //   final PageController pageController;
// //   final List<Widget> children;

// //   final DragStartBehavior dragStartBehavior;

// //   @override
// //   _FixTabBarViewState createState() => _FixTabBarViewState();
// // }

// // class _FixTabBarViewState extends State<FixTabBarView> {
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     widget.tabController.dispose();
// //     widget.pageController.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return PageView(
// //       dragStartBehavior: widget.dragStartBehavior,
// //       controller: widget.pageController,
// //       children: widget.children,
// //       onPageChanged: (index) {
// //         widget.tabController.animateTo(index);
// //       },
// //     );
// //   }
// // }
