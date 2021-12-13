import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/library/library_photo_view.dart';
import 'package:iloveyoucleanwater/views/library/library_video_view.dart';

class LibraryTabBarView extends StatefulWidget {
  @override
  _LibraryTabBarViewState createState() => _LibraryTabBarViewState();
}

class _LibraryTabBarViewState extends State<LibraryTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      child: Column(
        children: <Widget>[
          Container(
            color: kGrey3,
            constraints: const BoxConstraints.expand(height: 50),
            child: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: kGrey1,
              controller: controller,
              tabs: <Widget>[
                Tab(text: 'album'.tr),
                Tab(text: 'video'.tr),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  SubPage(
                    tag: "album",
                  ),
                  SubPage(
                    tag: 'video',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      length: 2,
    );
  }
}

class SubPage extends StatefulWidget {
  String tag;
  SubPage({required this.tag});
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.tag.contains('album')
        ? LibraryPhotoView(tag: 'album')
        : LibraryVideoView(
            tag: 'video',
          );
  }

  @override
  bool get wantKeepAlive => true;
}
