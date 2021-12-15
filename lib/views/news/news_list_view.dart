import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';

class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView>
    with SingleTickerProviderStateMixin {
  EasyRefreshController easyRefreshController = new EasyRefreshController();
  late TabController controller;
  final _controller = Get.put(NewsController());
  final _Homecontroller = Get.put(HomeController());
  bool _disposed = false;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controller.listCategory.length; i++) {
      _controller.getLoadMoreRefresh(true, _controller.listCategory[i].id);
    }

    controller =
        TabController(length: _controller.listCategory.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    _disposed = true;
    easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (newsController) => DefaultTabController(
          length: 2,
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
                  isScrollable: true,
                  controller: controller,
                  tabs: newsController.listCategory.map((text) {
                    return Tab(
                      text: text.title,
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                      controller: controller,
                      children: List.generate(
                          newsController.listCategory.length, (indexs) {
                        var recent = newsController.listCategory[indexs];

                        return EasyRefresh.custom(
                          controller: easyRefreshController,
                          header: ClassicalHeader(
                            refreshText: 'Kéo xuống làm mới',
                            refreshingText: "Làm mới...",
                            refreshedText: "Làm mới hoàn tất",
                            refreshFailedText: "Làm mới không thành công",
                            infoText: "Cập nhật %T",
                            refreshReadyText: "nhả ra để làm mới",
                          ),
                          footer: ClassicalFooter(
                            loadText: "load hoàn tất",
                            noMoreText: "Không còn dữ liệu",
                            loadReadyText: "Nhả ra để làm mới ",
                            loadingText: "Đang tải..",
                            loadFailedText: "Không còn dữ liệu",
                            showInfo: false,
                          ),
                          onRefresh: () async {
                            final result = await newsController
                                .getLoadMoreRefresh(true, recent.id);
                            if (result) {
                              easyRefreshController.finishRefresh(
                                  success: true);
                            } else {
                              easyRefreshController.finishRefresh(
                                  success: false);
                            }
                          },
                          onLoad: () async {
                            var check = newsController.listCategory[indexs];
                            final result = await newsController
                                .getLoadMoreRefresh(false, recent.id);
                            if (result) {
                              easyRefreshController.finishLoad(success: true);
                            } else {
                              easyRefreshController.finishLoad(success: false);
                            }
                          },
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                var recents = newsController
                                    .listCategory[indexs].news[index];
                                return Hero(
                                  tag: "aaaa$index",
                                  child: InkWell(
                                    onTap: () {
                                      _Homecontroller.getNewsDetailsModel(
                                          recents);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 135.0,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: NewWidgetView(news: recents),
                                    ),
                                  ),
                                );
                              },
                                  childCount: newsController
                                      .listCategory[indexs].news.length),
                            )
                          ],
                        );
                      })),
                ),
              ),
            ],
          )),
    );
  }
}
