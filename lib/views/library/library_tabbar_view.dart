import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/library/library_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';

class LibraryTabBarView extends StatefulWidget {
  @override
  _LibraryTabBarViewState createState() => _LibraryTabBarViewState();
}

class _LibraryTabBarViewState extends State<LibraryTabBarView>
    with SingleTickerProviderStateMixin {
  EasyRefreshController easyRefreshController = EasyRefreshController();
  EasyRefreshController easyRefreshControllervideo = EasyRefreshController();
  late TabController controller;
  final _controller = Get.put(LibraryController());
  final _homecontroller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    easyRefreshController.dispose();
    easyRefreshControllervideo.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      builder: (newsController) => DefaultTabController(
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: kGrey3,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              constraints: const BoxConstraints.expand(height: 50),
              child: TabBar(
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontStyle: FontStyle.normal,
                ),
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: kGrey1,
                controller: controller,
                tabs: <Widget>[
                  Tab(text: 'album'.tr),
                  Tab(text: 'video'.tr),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    EasyRefresh.custom(
                      controller: easyRefreshController,
                      header: ClassicalHeader(
                        refreshText: 'idleText'.tr,
                        refreshingText: 'refreshingText'.tr,
                        refreshedText: 'completeText'.tr,
                        refreshFailedText: 'refreshFailedText'.tr,
                        infoText: 'infoText'.tr,
                        refreshReadyText: 'releaseText'.tr,
                      ),
                      footer: ClassicalFooter(
                        loadText: 'loadText'.tr,
                        noMoreText: 'noMoreText'.tr,
                        loadReadyText: 'loadReadyText'.tr,
                        loadingText: 'loadingText'.tr,
                        loadFailedText: 'loadFailedText'.tr,
                        showInfo: false,
                      ),
                      onRefresh: () async {
                        final result =
                            await _controller.getPhoto(isLoadingP: true);
                        if (result) {
                          easyRefreshController.finishRefresh(success: true);
                        } else {
                          easyRefreshController.finishRefresh(success: false);
                        }
                      },
                      onLoad: () async {
                        final result = await _controller.getPhoto();
                        if (result) {
                          easyRefreshController.finishLoad(success: true);
                        } else {
                          easyRefreshController.finishLoad(success: false);
                        }
                      },
                      slivers: <Widget>[
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            var recent = _controller.listPhoto[index];
                            return Hero(
                              tag: "photo$index",
                              child: InkWell(
                                onTap: () {
                                  _homecontroller.getDetailPhotoHome(recent);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 15.0),
                                  width: double.infinity,
                                  height: 300.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: PrimaryCard(news: recent),
                                ),
                              ),
                            );
                          }, childCount: _controller.listPhoto.length),
                        )
                      ],
                    ),
                    EasyRefresh.custom(
                      //                       'releaseText': 'Nhả ra để làm mới',
                      // 'refreshingText': "Làm mới...",
                      // 'completeText': "Làm mới hoàn tất",
                      // 'idleText': "Kéo xuống làm mới",

                      controller: easyRefreshControllervideo,
                      header: ClassicalHeader(
                        refreshText: 'idleText'.tr,
                        refreshingText: 'refreshingText'.tr,
                        refreshedText: 'completeText'.tr,
                        refreshFailedText: 'refreshFailedText'.tr,
                        infoText: 'infoText'.tr,
                        refreshReadyText: 'releaseText'.tr,
                      ),
                      footer: ClassicalFooter(
                        loadText: 'loadText'.tr,
                        noMoreText: 'noMoreText'.tr,
                        loadReadyText: 'loadReadyText'.tr,
                        loadingText: 'loadingText'.tr,
                        loadFailedText: 'loadFailedText'.tr,
                        showInfo: false,
                      ),
                      onRefresh: () async {
                        final result =
                            await _controller.getVideo(isLoadingV: true);
                        if (result) {
                          easyRefreshControllervideo.finishRefresh(
                              success: true);
                        } else {
                          easyRefreshControllervideo.finishRefresh(
                              success: false);
                        }
                      },
                      onLoad: () async {
                        final result = await _controller.getVideo();
                        if (result) {
                          easyRefreshControllervideo.finishLoad(success: true);
                        } else {
                          easyRefreshControllervideo.finishLoad(success: false);
                        }
                      },
                      slivers: <Widget>[
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            var recent = _controller.listVideo[index];
                            return Hero(
                              tag: "photo$index",
                              child: InkWell(
                                onTap: () {
                                  _homecontroller.getDetailVideo(recent);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 15.0),
                                  width: double.infinity,
                                  height: 300.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: PrimaryCard(news: recent),
                                ),
                              ),
                            );
                          }, childCount: _controller.listVideo.length),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        length: 2,
      ),
    );
  }
}

// class SubPage extends StatefulWidget {
//   String tag;
//   SubPage({required this.tag});
//   @override
//   _SubPageState createState() => _SubPageState();
// }

// class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return widget.tag.contains('album')
//         ? LibraryPhotoView(tag: 'album')
//         : LibraryVideoView(
//             tag: 'video',
//           );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
