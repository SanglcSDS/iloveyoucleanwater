import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';

class NewsTabBarssss extends StatefulWidget {
  @override
  _NewsTabBarssssState createState() => _NewsTabBarssssState();
}

class _NewsTabBarssssState extends State<NewsTabBarssss>
    with SingleTickerProviderStateMixin {
  EasyRefreshController easyRefreshController = new EasyRefreshController();
  late TabController controller;
  final _controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    _controller.getLoadMoreRefresh(true, _controller.listCategory[1].id);
    controller =
        TabController(length: _controller.listCategory.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (newsController) => DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Column(
            children: <Widget>[
              Container(
                color: kGrey3,
                constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
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
                          header: ClassicalHeader(),
                          footer: ClassicalFooter(),
                          onRefresh: () async {
                            final result = await newsController
                                .getLoadMoreRefresh(true, recent.id);
                            if (result) {
                              easyRefreshController.finishRefresh(
                                  success: true);
                            }
                          },
                          onLoad: () async {
                            await newsController.getLoadMoreRefresh(
                                false, recent.id);

                            easyRefreshController.finishLoad(success: true);
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
                                    // onTap: () {
                                    //   _Homecontroller.getNewsDetailsModel(recent);
                                    // },
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
