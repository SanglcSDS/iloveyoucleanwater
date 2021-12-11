import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/views/introduce/home_tab_view.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';

class IntroduceView extends GetView<IntroduceController> {
  final _controller = Get.put(IntroduceController());
  @override
  Widget build(BuildContext context) {
    return _controller.listCategory.length > 0
        ? HomeTanView()
        : LoadingWidget();
  }
}
