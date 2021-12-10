import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListNewsView extends StatelessWidget {
  final String tag;
  ListNewsView({required this.tag});

  final controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: () async {
            final result = await controller.getPassengerData(isRefresh: true);
            if (result) {
              controller.refreshController.refreshCompleted();
            } else {
              controller.refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await controller.getPassengerData();
            if (result) {
              controller.refreshController.loadComplete();
            } else {
              controller.refreshController.loadFailed();
            }
          },
          child: ListView.builder(
            itemCount: controller.passengers.length,
            itemBuilder: (context, index) {
              var recent = controller.passengers[index];
              return Hero(
                tag: "$tag$index",
                child: InkWell(
                  onTap: () {
                    Get.to(() => ReadNewsView(news: recent));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 135.0,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: NewWidgetView(news: recent),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}