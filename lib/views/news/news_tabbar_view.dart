import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/news/news_list_view.dart';

class NewsTabBar extends StatefulWidget {
  @override
  _NewsTabBarViewState createState() => _NewsTabBarViewState();
}

class _NewsTabBarViewState extends State<NewsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final _controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    _controller.getCategory();
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
    return DefaultTabController(
      initialIndex: 0,
      child: Obx(() {
        return Column(
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
                tabs: _controller.listCategory.map((text) {
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
                  children: _controller.listCategory.map((text) {
                    return SubPage(
                      tab: text,
                      controllerTab: controller,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      }),
      length: 1,
    );
  }
}

class SubPage extends StatefulWidget {
  final CategoryModel tab;
  final TabController controllerTab;
  SubPage({required this.tab, required this.controllerTab});
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NewsListView(
      index: widget.tab.index,
      id: widget.tab.id,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
