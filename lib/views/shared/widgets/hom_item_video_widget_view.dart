import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/models/library/library_video_model.dart';

import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/library/library_video_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemVideoWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? Stack(
                children: [
                  Column(
                    children: <Widget>[
                      SafeArea(
                        child: SizedBox(
                            child: YoutubePlayer(
                          controller: controller.video,
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        child: Text(
                          controller.detail.title,
                          textAlign: TextAlign.justify,

                          //maxLines: 2,
                          style: kTitleCard1,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 5.0,
                              color: kGrey3,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: LibraryVideoView(
                          tag: "sss",
                        ),
                      )
                    ],
                  ),
                  SafeArea(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: kGrey2),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: YoutubePlayer(
                  controller: controller.video,
                ),
              ),
      ),
    );
  }
}
