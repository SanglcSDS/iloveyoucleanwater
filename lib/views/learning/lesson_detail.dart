import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lesson_detail_controller.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LessonDetailView extends StatelessWidget {
  final controller = Get.put(LessonDetailController());
  LessonDetailView({Key? key, this.lesson}) : super(key: key);
  final Lesson? lesson;
  bool showBackBtn = false;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(lesson!.url)!,
      params: const YoutubePlayerParams(
        autoPlay: true,
        showFullscreenButton: true,
      ),
    )..onEnterFullscreen;
    return GetBuilder<LessonDetailController>(
      init: LessonDetailController(),
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: YoutubePlayerControllerProvider(
                controller: _videoController,
                child: YoutubePlayerIFrame(
                  controller: _videoController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
