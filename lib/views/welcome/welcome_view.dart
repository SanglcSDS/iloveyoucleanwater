import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/views/home/home_tabbar_view.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GetBuilder<HomeController>(builder: (controller) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Em Yêu Nước Sạch',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              "assets/images/logo1.png",
            ),
            nextScreen: HomeTabBarView(),
            splashTransition: SplashTransition.fadeTransition,
            //  pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
    // });
  }
}
