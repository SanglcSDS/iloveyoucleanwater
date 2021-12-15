import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LibraryVideoView extends StatelessWidget {
  final String tag;
  LibraryVideoView({required this.tag});

  final _controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Obx(
        //   () => SmartRefresher(
        //     controller: _controller.refreshControllerTab,
        //     enablePullUp: true,
        //     onRefresh: () async {
        //       final result =
        //           await _controller.getEnvironmentalNews(isLoading: true);
        //       if (result) {
        //         _controller.refreshControllerTab.refreshCompleted();
        //       } else {
        //         _controller.refreshControllerTab.refreshFailed();
        //       }
        //     },
        //     onLoading: () async {
        //       final result = await _controller.getEnvironmentalNews();
        //       if (result) {
        //         _controller.refreshControllerTab.loadComplete();
        //       } else {
        //         _controller.refreshControllerTab.loadFailed();
        //       }
        //     },
        //     child: ListView.builder(
        //       itemCount: _controller.listEnvironmentalNews.length,
        //       itemBuilder: (context, index) {
        //         var recent = _controller.listEnvironmentalNews[index];
        //         return Hero(
        //           tag: "$tag$index",
        //           child: InkWell(
        //             onTap: () {
        //               Get.to(() => ReadNewsView(news: recent));
        //             },
        //             child: Container(
        //               width: double.infinity,
        //               height: 135.0,
        //               margin: const EdgeInsets.symmetric(horizontal: 10.0),
        //               child: NewWidgetView(news: recent),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        );
  }
}
