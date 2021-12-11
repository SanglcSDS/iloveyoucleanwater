import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/models/news/category_model.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/banner_home_view.dart';
import 'package:iloveyoucleanwater/views/introduce/failureView.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/home_item_news_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/primary_card.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/title_widget_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomSildeView extends StatelessWidget {
  List<CategoryModel> listCategory;
  TabController animaTeto;
  HomSildeView({
    required this.listCategory,
    required this.animaTeto,
  });
  final _Controller = Get.put(IntroduceController());
  final _controllerHome = Get.put(HomeController());
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
              color: Colors.grey,
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
    return Center(
      child: SmartRefresher(
        controller: _controllerHome.refreshHomeControllerNew,
        onRefresh: () async {
          final result = await _controllerHome.onRefreshHome(isRefresh: true);
          if (result) {
            _controllerHome.refreshHomeControllerNew.refreshCompleted();
          } else {
            _controllerHome.refreshHomeControllerNew.refreshFailed();
          }
        },
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Obx(
              () {
                if (_Controller.isDataProcessing.value) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.all(9),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_Controller.isDataErrer.value) {
                    return FailureVier(
                        title: "Error",
                        message: "on click loading slide ",
                        onPressed: () => _Controller.getPopular());
                  } else {
                    return CarouselSlider(
                      items: generateSlider(),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                    );
                  }
                }
              },
            ),
            const SizedBox(
              height: 7.0,
            ),
            BannerHomeView(),
            Obx(
              () => Column(
                children: List.generate(
                    _Controller.listCategoryNewsModel.length, (index) {
                  return historyNull(
                      _Controller.listCategoryNewsModel[index].news,
                      _Controller.listCategoryNewsModel[index].title,
                      _Controller.listCategoryNewsModel[index].item);
                }),
              ),
            ),
            // TitleWidgetView(
            //     title: 'album'.tr.toUpperCase(),
            //     onPressed: _controller.oClickLibrary0),
            // TitleWidgetView(
            //     title: 'video'.tr.toUpperCase(),
            //     onPressed: _controller.oClickLibrary1),
            TitleWidgetNextPhotoVideo(
                title: 'album'.tr.toUpperCase(),
                onPressed: _controllerHome.oClickLibrary0),

            Container(
              width: double.infinity,
              height: 300.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: List.generate(_controllerHome.listPhoto.length,
                        (index) {
                      var news = _controllerHome.listPhoto[index];

                      return Hero(
                        tag: "Imgarsss$index",
                        child: InkWell(
                          onTap: () {
                            _controllerHome.getDetailPhotoHome(news);
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 12.0, top: 5.0),
                            child: PrimaryCard(news: news),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TitleWidgetNextPhotoVideo(
                title: 'video'.tr.toUpperCase(),
                onPressed: _controllerHome.oClickLibrary1),
            Container(
              width: double.infinity,
              height: 300.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: List.generate(_controllerHome.listVideo.length,
                        (index) {
                      var news = _controllerHome.listVideo[index];

                      return Hero(
                        tag: "Videoss$index",
                        child: InkWell(
                          // onTap: () =>  Get.to(() => DetailsLibraryView(news: news)),
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 12.0, top: 5.0),
                            child: PrimaryCard(news: news),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget historyNull(List<NewModel> ListCategoryNews, String title, int index) {
    return Column(
      children: <Widget>[
        TitleWidgetNextView(
          title: title,
          onPressed: animaTeto,
          index: index,
        ),
        Column(
            children: List.generate(ListCategoryNews.length, (index) {
          var recent = ListCategoryNews[index];
          if (index == 0) {
            return Hero(
              tag: "ItemnewE$index",
              child: InkWell(
                // onTap: () {
                //   _controller.getNewsDetailsModel(recent);
                // },
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: HomeItemNewsWidgetView(news: recent),
                ),
              ),
            );
          } else {
            return Hero(
              tag: "newE$index",
              child: InkWell(
                // onTap: () {
                //   _controller.getNewsDetailsModel(recent);
                // },
                child: Container(
                  width: double.infinity,
                  height: 120.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: NewWidgetView(news: recent),
                ),
              ),
            );
          }
        })),
      ],
    );
  }
}
