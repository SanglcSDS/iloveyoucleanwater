import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iloveyoucleanwater/controllers/welcome/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  // final controller = Get.put(HomeController());

  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome"),
    );
  }
}
