import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LibraryVideoView extends StatelessWidget {
  final String tag;
  LibraryVideoView({required this.tag});

  final _controller = Get.put(LibraryController());
  final _homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => SmartRefresher(
          header: ClassicHeader(
            releaseText: 'releaseText'.tr,
            refreshingText: 'refreshingText'.tr,
            completeText: 'completeText'.tr,
            idleText: 'idleText'.tr,
          ),
          footer: ClassicFooter(
            loadingText: 'loadText'.tr,
            failedText: 'noMoreText'.tr,
          ),
          controller: _controller.refreshControllerVideo,
          enablePullUp: true,
          onRefresh: () async {
            final result = await _controller.getVideo(isLoadingV: true);
            if (result) {
              _controller.refreshControllerVideo.refreshCompleted();
            } else {
              _controller.refreshControllerVideo.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await _controller.getVideo();
            if (result) {
              _controller.refreshControllerVideo.loadComplete();
            } else {
              _controller.refreshControllerVideo.loadFailed();
            }
          },
          child: ListView.builder(
            itemCount: _controller.listVideo.length,
            itemBuilder: (context, index) {
              var recent = _controller.listVideo[index];
              return Hero(
                tag: "$tag$index",
                child: InkWell(
                  onTap: () {
                    _homecontroller.getDetailVideo(recent);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0),
                    width: double.infinity,
                    height: 300.0,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: PrimaryCard(news: recent),
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
