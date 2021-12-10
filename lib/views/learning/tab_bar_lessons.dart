import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/learning/comments.dart';
import 'package:iloveyoucleanwater/views/learning/documents.dart';
import 'package:iloveyoucleanwater/views/learning/lessons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningView extends StatelessWidget {
  final _controller = Get.put(LessonController());
  LearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LessonController(),
      builder: (_) => DefaultTabController(
        length: 3,
        child: WillPopScope(
          onWillPop: () async {
            if (MediaQuery.of(context).orientation == Orientation.landscape) {
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: MediaQuery.of(context).orientation == Orientation.portrait
                ? Stack(
                    children: [
                      Column(
                        children: <Widget>[
                          SafeArea(
                            child: SizedBox(
                              child: Obx(
                                () => YoutubePlayer(
                                    controller:
                                        _controller.videoController!.value,
                                    onEnded: (_) =>
                                        _controller.videoEnded(context)),
                              ),
                            ),
                          ),
                          const TabBar(
                            tabs: [
                              Tab(
                                child: Text('Bài học',
                                    style: TextStyle(color: kBlack)),
                              ),
                              Tab(
                                child: Text('Thảo luận',
                                    style: TextStyle(color: kBlack)),
                              ),
                              Tab(
                                child: Text('Tài liệu',
                                    style: TextStyle(color: kBlack)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                LessonView(),
                                CommentView(),
                                DocumentView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SafeArea(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: IconButton(
                            icon:
                                const Icon(Icons.arrow_back_ios, color: kGrey2),
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
                      controller: _controller.videoController!.value,
                      onEnded: (_) {
                        _controller.videoEnded(context);
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
