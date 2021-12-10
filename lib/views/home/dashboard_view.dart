import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/utils/language/dropdown_language.dart';
import 'package:iloveyoucleanwater/views/home/banner_home_view.dart';
import 'package:iloveyoucleanwater/views/home/home_detail_new_view.dart';
import 'package:iloveyoucleanwater/views/home/home_loading_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_loading_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_slider_view.dart';
import 'package:iloveyoucleanwater/views/library/library_details_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/home_item_news_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:iloveyoucleanwater/views/news/read_news_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/title_widget_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardView extends StatelessWidget {
  final _controller = Get.put(HomeController());
  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) => Scaffold(
        // AppBar(
        //   brightness: Brightness.light,
        //   backgroundColor: Colors.white,
        //   iconTheme: IconThemeData(
        //     color: Theme.of(context).primaryColor,
        //   ),
        //   leading: IconButton(
        //     icon: const Icon(Icons.settings, color: kGrey1),
        //     onPressed: () => Get.to(NewsView()),
        //   ),
        //   actions: <Widget>[
        //     DropdownLanguage(),
        //     const SizedBox(width: 12),
        //   ],
        //   title: Center(
        //     child: Image.asset(
        //       'assets/images/logo.png',
        //       fit: BoxFit.cover,
        //       width: MediaQuery.of(context).size.width * 0.45,
        //     ),
        //   ),
        // ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, idex) => [
            SliverAppBar(
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
              // leading: IconButton(
              //   icon: const Icon(Icons.settings, color: kGrey1),
              //   onPressed: () => Get.to(NewsView()),
              // ),
              backgroundColor: Colors.white,
              // flexibleSpace: FlexibleSpaceBar(
              //   background: Image.asset(
              //     'assets/images/logo.png',
              //     fit: BoxFit.cover,
              //     width: 12,
              //     height: 12,

              //     ///width: MediaQuery.of(context).size.width,
              //   ),
              // ),

              centerTitle: true,
              //expandedHeight: 100.0,
            )
          ],
          body: Container(
            child: SmartRefresher(
              controller: _controller.refreshHomeController,
              onRefresh: () async {
                final result = await _controller.onRefreshHome(isRefresh: true);
                if (result) {
                  _controller.refreshHomeController.refreshCompleted();
                } else {
                  _controller.refreshHomeController.refreshFailed();
                }
              },

              // onLoading: () async {
              //   final result = await _controller.onRefreshHome();
              //   if (result) {
              //     _controller.refreshHomeController.loadComplete();
              //   } else {
              //     _controller.refreshHomeController.loadFailed();
              //   }
              // },
              child:
                  //isRefresh==true?CircularProgressIndicator():
                  SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(child: GetBuilder<HomeController>(
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
                    )),
                    BannerHomeView(),
                    TitleWidgetView(
                        title: 'news'.tr.toUpperCase(),
                        onPressed: _controller.oClickNews0),
                    Obx(
                      () => Column(
                        children: List.generate(
                            _controller.listEnvironmentalNewsitem.length > 0
                                ? 1
                                : _controller.listEnvironmentalNewsitem.length,
                            (index) {
                          var news =
                              _controller.listEnvironmentalNewsitem[index];

                          return Hero(
                            tag: "newEitem$index",
                            child: InkWell(
                              onTap: () {
                                _controller.getNewsDetailsModel(news);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 300.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 7.0),
                                child: HomeItemNewsWidgetView(news: news),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: List.generate(
                            _controller.listEnvironmentalNews.length, (index) {
                          var recent = _controller.listEnvironmentalNews[index];

                          return Hero(
                            tag: "newE$index",
                            child: InkWell(
                              onTap: () {
                                _controller.getNewsDetailsModel(recent);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 135.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: NewWidgetView(news: recent),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TitleWidgetNextView(
                        title: 'all'.tr, onPressed: _controller.oClickNews1),
                    Obx(
                      () => Column(
                        children: List.generate(
                            _controller.listProgramNewitem.length > 0
                                ? 1
                                : _controller.listProgramNewitem.length,
                            (index) {
                          var news = _controller.listProgramNewitem[index];

                          return Hero(
                            tag: "newPItem$index",
                            child: InkWell(
                              onTap: () {
                                _controller.getNewsDetailsModel(news);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 300.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 7.0),
                                child: HomeItemNewsWidgetView(news: news),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: List.generate(
                            _controller.listProgramNew.length, (index) {
                          var recent = _controller.listProgramNew[index];

                          return Hero(
                            tag: "NewP$index",
                            child: InkWell(
                              onTap: () {
                                _controller.getNewsDetailsModel(recent);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 135.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: NewWidgetView(news: recent),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    TitleWidgetNextView(
                        title: 'all'.tr, onPressed: _controller.oClickNews0),
                    TitleWidgetView(
                        title: 'album'.tr.toUpperCase(),
                        onPressed: _controller.oClickLibrary0),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                          () => Row(
                            children: List.generate(
                                _controller.listPhoto.length, (index) {
                              var news = _controller.listPhoto[index];

                              return Hero(
                                tag: "Imgarsss$index",
                                child: InkWell(
                                  onTap: () {
                                    _controller.getDetailPhotoHome(news);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 12.0, top: 5.0),
                                    child: PrimaryCard(news: news),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
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
                        onPressed: _controller.oClickLibrary1),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                          () => Row(
                            children: List.generate(
                                _controller.listVideo.length, (index) {
                              var news = _controller.listVideo[index];

                              return Hero(
                                tag: "Videoss$index",
                                child: InkWell(
                                  // onTap: () =>  Get.to(() => DetailsLibraryView(news: news)),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 12.0, top: 5.0),
                                    child: PrimaryCard(news: news),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ],
              // ),
            ),
          ),
        ),
        //  drawer: CustomDrawer(),
      );
}
