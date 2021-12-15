import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/home/custom_drawer.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';

class HomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, idex) => [
          SliverAppBar(
            // pinned: true,
            floating: true,
            //   snap: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Container(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.55,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.login, color: primaryColor),
                onPressed: () => Get.toNamed(Routes.LOGIN),
              ),
            ],
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.bars, color: kGrey1),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )
        ],
        body: HomeView(),
      ),
    );
  }
}
