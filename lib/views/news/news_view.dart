import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/news/news_environmental_view.dart';
import 'package:iloveyoucleanwater/views/news/news_program_view.dart';
import 'package:iloveyoucleanwater/views/news/news_tabbar_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';
import 'package:shimmer/shimmer.dart';

class NewsView extends GetView<NewsController> {
  final _controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, idex) => [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Container(
              child: Text('news'.tr, style: TextStyle(color: kGrey1)),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: kGrey1),
              onPressed: () => Get.back(),
            ),
          )
        ],
        body:

            //  Shimmer.fromColors(
            //   baseColor: Colors.grey[400]!,
            //   highlightColor: Colors.grey[100]!,
            //   child: Container(
            //     width: double.infinity,
            //     height: double.infinity,
            //     color: Colors.white,
            //   ),
            // ),

            _controller.listCategory.length > 0
                ? NewsTabBar()
                : LoadingWidget(),
      ),
    );
  }
}
