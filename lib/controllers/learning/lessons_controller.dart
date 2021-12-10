import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/msg_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LessonController extends GetxController {
  late String title;
  RxBool isComplete = false.obs;
  RxDouble? percent;
  RxString? percentStr;
  RxList<Lesson>? lessons;
  Rx<Lesson>? currentLesson;
  RxInt? activeIndex;
  RxString? currentUrl;
  Rx<YoutubePlayerController>? videoController;

  @override
  void onInit() {
    percent = 0.5.obs;
    percentStr = '50% Hoàn thành'.obs;
    super.onInit();
  }

  void onInitLesson(List<Lesson> list) {
    if (list.isNotEmpty) {
      lessons = list.obs;
      currentLesson = list[0].obs;
      for (int i = 0; i < list.length; i++) {
        if (list[i].unlocked) {
          currentLesson = list[i].obs;
          activeIndex = i.obs;
        }
      }
      currentUrl = currentLesson!.value.url.obs;

      videoController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(currentUrl!.value)!,
        flags: const YoutubePlayerFlags(
          controlsVisibleAtStart: true,
          autoPlay: false,
        ),
      ).obs;
    }
  }

  void changeLesson(Lesson lesson, int index) {
    if (lesson.unlocked) {
      currentLesson = lesson.obs;
      currentUrl = lesson.url.obs;
      activeIndex = index.obs;

      videoController!.value
          .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
      update();
    }
  }

  void videoEnded(context) {
    int length = lessons!.length - 1;
    if (activeIndex!.value < length) {
      activeIndex = (activeIndex!.value + 1).obs;
      currentLesson = lessons![activeIndex!.value].obs;
      currentUrl = lessons![activeIndex!.value].url.obs;

      videoController!.value
          .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
    } else {
      isComplete = true.obs;
      MsgDialog.showMsgDialogs(
          context,
          'Congratulations',
          'Chúc mừng bạn đã hoàn thành khóa học!\nLàm bài kiểm tra ngay?',
          () => Get.toNamed(Routes.QUESTIONS));
      // Get.toNamed(Routes.QUESTIONS);
    }

    update();
  }
}
