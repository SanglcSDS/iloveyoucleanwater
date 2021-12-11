import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/introduce/test.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';

class HomeTanView extends StatefulWidget {
  @override
  __HomeTanViewState createState() => __HomeTanViewState();
}

class __HomeTanViewState extends State<HomeTanView>
    with SingleTickerProviderStateMixin {
  final _controller = Get.put(IntroduceController());
  late TabController _controllerTab;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerTab =
        TabController(length: _controller.listCategory.length, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, idex) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
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
                  icon: const Icon(Icons.settings, color: kGrey1),
                  onPressed: () => Get.to(NewsView()),
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,

                unselectedLabelColor: kGrey1,
                controller: _controllerTab,
                isScrollable: true,
                // labelStyle:
                //     const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // unselectedLabelStyle:
                //     const TextStyle(fontStyle: FontStyle.normal, fontSize: 14),
                tabs: List.generate(_controller.listCategory.length, (index) {
                  if (index == 0) {
                    return Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.home),
                          const SizedBox(width: 5),
                          Text(_controller.listCategory[index].title)
                        ],
                      ),
                    );
                  } else {
                    return Tab(
                      text: _controller.listCategory[index].title,
                    );
                  }
                }),
              ),
            )
          ],
          body: TabBarView(
            controller: _controllerTab,
            children: List.generate(_controller.listCategory.length, (index) {
              if (index == 0) {
                return HomSildeView(
                  listCategory: _controller.listCategory,
                  animaTeto: _controllerTab,
                );
              } else {
                return Tab(
                  text: _controller.listCategory[index].title,
                );
              }
            }),
          ),
        ),
      );
}
