import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/news/news_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/news/news_list_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';

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
              child: Text('news'.tr, style: TextStyle(color: primaryColor)),
            ),
          )
        ],
        body: _controller.listCategory.length > 0
            ? NewsListView()
            : LoadingWidget(),
      ),
    );
  }
}
