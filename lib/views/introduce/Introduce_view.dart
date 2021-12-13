import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';

class IntroduceView extends GetView<IntroduceController> {
  final _controller = Get.put(IntroduceController());
  @override
  Widget build(BuildContext context) {
    return Text(" sánnsn");

    // _controller.listCategoryNewPage.length > 0
    //     ? HomeTanView()
    //     : LoadingWidget();
  }
}
