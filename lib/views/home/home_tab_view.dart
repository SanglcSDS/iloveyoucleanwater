import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';

import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/home_news_list_view.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';

class HomeTabView extends StatefulWidget {
  @override
  __HomeTabViewState createState() => __HomeTabViewState();
}

class __HomeTabViewState extends State<HomeTabView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  final _controller = Get.put(HomeController());
  late TabController _controllerTab;
  @override
  void initState() {
    super.initState();
    _controllerTab = TabController(
        length: _controller.listCategoryNewPage.length, vsync: this);
    _pageController = PageController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _controllerTab.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, idex) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Container(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.55,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings, color: kGrey1),
                onPressed: () => Get.to(NewsView()),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: kGrey1,
              controller: _controllerTab,
              isScrollable: true,
              tabs: _controller.listCategoryNewPage.map((text) {
                if (text.id == 0) {
                  return Tab(
                    child: Row(
                      children: [
                        const Icon(Icons.home),
                        const SizedBox(width: 5),
                        Text(text.title)
                      ],
                    ),
                  );
                } else {
                  return Tab(
                    text: text.title,
                  );
                }
              }).toList(),
            ),
          )
        ],
        body: TabBarView(
          controller: _controllerTab,
          children: _controller.listCategoryNewPage.map((text) {
            return Page(
              tab: text,
              controllerTab: _controllerTab,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  final CategoryModel tab;
  final TabController controllerTab;
  Page({required this.tab, required this.controllerTab});

  @override
  _PageState createState() =>
      _PageState(tab: tab, controllerTab: controllerTab);
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  CategoryModel tab;
  TabController controllerTab;
  _PageState({required this.tab, required this.controllerTab});
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return tab.id == 0
        ? HomeView(
            animaTeto: controllerTab,
          )
        : HomeNewsListView(
            index: tab.index,
            id: tab.id,
          );
  }

  @override
  bool get wantKeepAlive => true;
}
