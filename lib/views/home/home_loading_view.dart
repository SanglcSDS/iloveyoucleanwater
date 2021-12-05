import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/home_news_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_loading_view.dart';
import 'package:iloveyoucleanwater/views/home/slide/carousel_slider_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/new_widget_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/read_news_view.dart';

class HomeLoadingView extends StatefulWidget {
  bool isRelod;
  HomeLoadingView({required this.isRelod});
  @override
  HomeLoadingViewState createState() => HomeLoadingViewState();
}

final controller = Get.put(HomeController());
final refrshKey = const Key('__RIKEY1__');
//var refrshKey = GlobalKey<RefreshIndicatorState>();

class HomeLoadingViewState extends State<HomeLoadingView> {
  Future<void> onRefresh() async {
    // controller.loadingHome;
    setState(() {
      controller.fetchCarousel;
      Future.delayed(Duration(seconds: 2));
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (this.widget.isRelod) {
        await controller.loadingHome;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (controller.isloadingHome.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return RefreshIndicator(
            key: refrshKey,
            onRefresh: onRefresh,
            child: ListView.builder(
              itemCount: 1,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var recent = controller.news[index];
                return Column(
                  children: [
                    GetBuilder<HomeController>(
                      builder: (_c) {
                        if (_c.isLoading) if (_c.carouselData.length > 0)
                          return CarouselSliderView(_c.carouselData);
                        else
                          return CarouselLoadingView();
                        else if (_c.carouselData.length > 0)
                          return CarouselSliderView(_c.carouselData);
                        else
                          return CarouselLoadingView();
                      },
                    ),
                    Hero(
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
                    ),
                  ],
                );
              },
            ),
          );
      }),
    );
  }
}
