import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/utils/language/dropdown_language.dart';
import 'package:iloveyoucleanwater/views/home/banner_home_view.dart';
import 'package:iloveyoucleanwater/views/home/home_loading_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_loading_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_slider_view.dart';
import 'package:iloveyoucleanwater/views/library/details_library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/read_news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/title_widget_view.dart';

class DashboardView extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings, color: kGrey1),
          onPressed: () => Get.to(NewsView()),
        ),
        actions: <Widget>[
          DropdownLanguage(),
          const SizedBox(width: 12),
        ],
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
      ),
      //  drawer: CustomDrawer(),
      body:

          // HomeLoadingView(
          //   isRelod: true,
          // ),

          ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GetBuilder<HomeController>(
                builder: (_c) {
                  if (_c.isLoading) if (_c.listBanner.length > 0)
                    return CarouselSliderView(_c.listBanner);
                  else
                    return CarouselLoadingView();
                  else if (_c.listBanner.length > 0)
                    return CarouselSliderView(_c.listBanner);
                  else
                    return CarouselLoadingView();
                },
              ),
              BannerHomeView(),
              TitleWidgetView(
                  title: 'news'.tr.toUpperCase(),
                  onPressed: controller.oClickNews0),
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var recent = recentList[index];
                  return Hero(
                    tag: "TTCT$index",
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
              TitleWidgetNextView(
                  title: 'all'.tr, onPressed: controller.oClickNews0),
              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  var recent = recentList[index];
                  return Hero(
                    tag: "TTMT$index",
                    child: InkWell(
                      onTap: () => Get.to(() => ReadNewsView(news: recent)),
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
              TitleWidgetNextView(
                  title: 'all'.tr, onPressed: controller.oClickNews1),
              TitleWidgetView(
                  title: 'album'.tr.toUpperCase(),
                  onPressed: controller.oClickLibrary0),
              Container(
                width: double.infinity,
                height: 300.0,
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  itemCount: popularList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var news = popularList[index];
                    return InkWell(
                      onTap: () => Get.to(() => DetailsLibraryView(news: news)),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12.0, top: 5.0),
                        child: PrimaryCard(news: news),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: kGrey3,
                    ),
                  ),
                ),
              ),
              TitleWidgetView(
                  title: 'video'.tr.toUpperCase(),
                  onPressed: controller.oClickLibrary1),
              Container(
                width: double.infinity,
                height: 300.0,
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  itemCount: trendingList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var news = trendingList[index];
                    return InkWell(
                      onTap: () => Get.to(() => DetailsLibraryView(news: news)),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12.0, top: 5),
                        child: PrimaryCard(news: news),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
