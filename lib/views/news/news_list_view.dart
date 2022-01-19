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

  final _controller = Get.put(NewsController());
  final _Homecontroller = Get.put(HomeController());

  @override
  void initState() {
    _controller.controllernew =
        TabController(length: _controller.listCategory.length, vsync: this);
    for (int i = 0; i < _controller.listCategory.length; i++) {
      _controller.getLoadMoreRefresh(true, _controller.listCategory[i].id);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.controllernew.dispose();
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
                  controller: newsController.controllernew,
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
                      controller: newsController.controllernew,
                      children: List.generate(
                          newsController.listCategory.length, (indexs) {
                        var recent = newsController.listCategory[indexs];

                        return EasyRefresh.custom(
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
                                          recents, indexs);
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
