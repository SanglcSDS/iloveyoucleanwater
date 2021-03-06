import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/banner_home_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/home_item_news_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/title_widget_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatelessWidget {
  RefreshController refreshHomeController =
      RefreshController(initialRefresh: false);

  final _Controller = Get.put(HomeController());

  List<Widget> generateSlider() {
    List<Widget> imageSlides = _Controller.listPopular.map((item) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: (item.image.contains(Constants.URL_IMAGE)
                ? item.image
                : Constants.URL_IMAGE + item.image),
            fit: BoxFit.cover,
            width: Get.width,
            placeholder: (context, url) => Container(
              color: kGrey3,
            ),
            errorWidget: (context, url, rerror) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      );
    }).toList();
    return imageSlides;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: SmartRefresher(
          header: ClassicHeader(
            releaseText: 'releaseText'.tr,
            refreshingText: 'refreshingText'.tr,
            completeText: 'completeText'.tr,
            idleText: 'idleText'.tr,
          ),
          controller: refreshHomeController,
          onRefresh: () async {
            final result = await _Controller.onRefreshHome(isRefresh: true);
            if (result) {
              refreshHomeController.refreshCompleted();
            } else {
              refreshHomeController.refreshFailed();
            }
          },
          child: (_Controller.isloadingHome.value)
              ? LoadingWidget()
              : SingleChildScrollView(
                  child: Column(children: <Widget>[
                    (_Controller.isDataProcessing.value)
                        ? LoadingSlide(
                            width: 170,
                          )
                        : CarouselSlider(
                            items: generateSlider(),
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                          ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    InkWell(
                      onTap: () {
                        _Controller.changeTabIntroduce(2, 0);
                      },
                      child: BannerHomeView(),
                    ),
                    Column(
                      children: List.generate(
                          _Controller.listCategoryNewsModel.length, (indexs) {
                        return _Controller
                                    .listCategoryNewsModel[indexs].news.length >
                                0
                            ? Hero(
                                tag: 'trg$indexs',
                                child: Column(
                                  children: <Widget>[
                                    TitleWidgetNextView(
                                        news: _Controller
                                            .listCategoryNewsModel[indexs],
                                        //  onPressed: animaTeto,
                                        index: 1),
                                    Column(
                                        children: List.generate(
                                            _Controller
                                                .listCategoryNewsModel[indexs]
                                                .news
                                                .length, (index) {
                                      var recent = _Controller
                                          .listCategoryNewsModel[indexs]
                                          .news[index];
                                      if (index == 0) {
                                        return InkWell(
                                          onTap: () {
                                            _Controller.getNewsDetailsModel(
                                                recent, indexs);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 350.0,
                                            child: HomeItemNewsWidgetView(
                                                news: recent),
                                          ),
                                        );
                                      } else {
                                        return InkWell(
                                          onTap: () {
                                            _Controller.getNewsDetailsModel(
                                                recent,
                                                _Controller
                                                    .listCategoryNewsModel[
                                                        indexs]
                                                    .item);
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 120.0,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: NewWidgetView(news: recent),
                                          ),
                                        );
                                      }
                                    })),
                                  ],
                                ),
                              )
                            : Container();
                      }),
                    ),
                    _Controller.listPhoto.length > 0
                        ? TitleWidgetNextPhotoVideo(
                            title: 'album'.tr.toUpperCase(),
                            index: 3,
                            index1: 0,
                          )
                        : Container(),
                    _Controller.listPhoto.length > 0
                        ? Container(
                            //  padding: EdgeInsets.only(left: 6, right: 6),
                            width: double.infinity,
                            height: 300.0,
                            // margin: EdgeInsets.all(12),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    _Controller.listPhoto.length, (index) {
                                  var news = _Controller.listPhoto[index];
                                  if (index == 0) {
                                    return Hero(
                                      tag: "Image1$index",
                                      child: InkWell(
                                        onTap: () {
                                          _Controller.getDetailPhotoHome(news);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10, left: 10, top: 5.0),
                                          child: PrimaryCard(news: news),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Hero(
                                      tag: "Image1$index",
                                      child: InkWell(
                                        onTap: () {
                                          _Controller.getDetailPhotoHome(news);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 5.0, right: 10),
                                          child: PrimaryCard(news: news),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    _Controller.listVideo.length > 0
                        ? TitleWidgetNextPhotoVideo(
                            title: 'video'.tr.toUpperCase(),
                            index: 3,
                            index1: 1,
                          )
                        : Container(),
                    _Controller.listVideo.length > 0
                        ? Container(
                            width: double.infinity,
                            height: 300.0,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    _Controller.listVideo.length, (index) {
                                  var news = _Controller.listVideo[index];
                                  if (index == 0) {
                                    return Hero(
                                      tag: "Videoss$index",
                                      child: InkWell(
                                        onTap: () {
                                          _Controller.getDetailVideo(news);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0,
                                              left: 10.0,
                                              top: 5.0),
                                          child: PrimaryCard(news: news),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Hero(
                                      tag: "Videoss$index",
                                      child: InkWell(
                                        onTap: () {
                                          _Controller.getDetailVideo(news);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10.0, top: 5.0),
                                          child: PrimaryCard(news: news),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ),
                            ),
                          )
                        : Container(),
                  ]),
                ),
        ),
      ),
    );
  }

  // Widget historyNull(List<NewModel> ListCategoryNews, String title, int index) {
  //   return Column(
  //     children: <Widget>[
  //       TitleWidgetNextView(
  //         title: title,
  //         //  onPressed: animaTeto,
  //         index: index,
  //       ),
  //       Column(
  //           children: List.generate(ListCategoryNews.length, (index) {
  //         var recent = ListCategoryNews[index];
  //         if (index == 0) {
  //           return InkWell(
  //             onTap: () {
  //               _Controller.getNewsDetailsModel(recent);
  //             },
  //             child: Container(
  //               width: double.infinity,
  //               height: 350.0,
  //               child: HomeItemNewsWidgetView(news: recent),
  //             ),
  //           );
  //         } else {
  //           return InkWell(
  //             onTap: () {
  //               _Controller.getNewsDetailsModel(recent);
  //             },
  //             child: Container(
  //               width: double.infinity,
  //               height: 120.0,
  //               margin: const EdgeInsets.symmetric(horizontal: 10.0),
  //               child: NewWidgetView(news: recent),
  //             ),
  //           );
  //         }
  //       })),
  //     ],
  //   );
  // }
}
