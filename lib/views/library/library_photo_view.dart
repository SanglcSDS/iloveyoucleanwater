import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LibraryPhotoView extends StatelessWidget {
  final String tag;
  LibraryPhotoView({required this.tag});

  final _controller = Get.put(LibraryController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => SmartRefresher(
          controller: _controller.refreshControllerPhoto,
          enablePullUp: true,
          onRefresh: () async {
            final result = await _controller.getPhoto(isLoadingP: true);
            if (result) {
              _controller.refreshControllerPhoto.refreshCompleted();
            } else {
              _controller.refreshControllerPhoto.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await _controller.getPhoto();
            if (result) {
              _controller.refreshControllerPhoto.loadComplete();
            } else {
              _controller.refreshControllerPhoto.loadFailed();
            }
          },
          child: ListView.builder(
            itemCount: _controller.listPhoto.length,
            itemBuilder: (context, index) {
              var recent = _controller.listPhoto[index];
              return Hero(
                tag: "$tag$index",
                child: InkWell(
                  onTap: () {
                    _controller.getDetailPhotoHome(recent);
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
