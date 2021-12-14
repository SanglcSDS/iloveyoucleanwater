import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/msg_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonController extends GetxController {
  late String title;
  late int _courseId;
  RxBool isComplete = false.obs;
  RxDouble? percent;
  RxString? percentStr;
  RxList<Lesson>? lessons;
  Rx<Lesson>? currentLesson;
  RxInt? activeIndex;
  RxString? currentUrl;
  Rx<YoutubePlayerController>? videoController;
  final LearningService _learningService = Get.put(LearningService());

  @override
  void onInit() {
    percent = 0.0.obs;
    percentStr = '0% Hoàn thành'.obs;
    super.onInit();
  }

  void onInitLesson(int courseId) async {
    debugPrint("course id =======> " + courseId.toString());
    _courseId = courseId;
    Response<dynamic> response =
        await _learningService.getLessonByCoureseId(courseId);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.body;
      List<Lesson> list = [];
      if (body.containsKey("lessons")) {
        for (var lessonJson in (body["lessons"] as List)) {
          list.add(Lesson.fromJson(lessonJson));
        }
      }
      lessons = list.obs;
      if (list.isNotEmpty) {
        int countUnlockLesson = 0;
        currentLesson = list[0].obs;
        for (int i = 0; i < list.length; i++) {
          if (list[i].statusWork) {
            currentLesson = list[i].obs;
            activeIndex = i.obs;
            countUnlockLesson++;
          }
        }
        currentUrl = currentLesson!.value.url.obs;
        percent = (countUnlockLesson / list.length).obs;
        percentStr = '${(percent! * 100).floor()} % Hoàn thành'.obs;

        videoController = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(currentUrl!.value)!,
          flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            autoPlay: false,
          ),
        ).obs;
      } else {
        // Không có bài học
      }
      update();
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  void changeLesson(Lesson lesson, int index) {
    if (lesson.statusWork) {
      currentLesson = lesson.obs;
      currentUrl = lesson.url.obs;
      activeIndex = index.obs;
      videoController!.value
          .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
      update();
    }
  }

  // void videoEnded(context) {
  //   int length = lessons!.length - 1;
  //   if (activeIndex!.value < length) {
  //     activeIndex = (activeIndex!.value + 1).obs;
  //     currentLesson = lessons![activeIndex!.value].obs;
  //     currentUrl = lessons![activeIndex!.value].url.obs;

  //     videoController!.value
  //         .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
  //   } else {
  //     isComplete = true.obs;
  //     MsgDialog.showMsgDialogs(
  //         context,
  //         'Congratulations',
  //         'Chúc mừng bạn đã hoàn thành khóa học!\nLàm bài kiểm tra ngay?',
  //         () => Get.toNamed(Routes.QUESTIONS));
  //     // Get.toNamed(Routes.QUESTIONS);
  //   }

  //   update();
  // }

  void videoEnded(context) async {
    int length = lessons!.length - 1;
    if (activeIndex!.value < length) {
      activeIndex = (activeIndex!.value + 1).obs;
      currentLesson = lessons![activeIndex!.value].obs;
      currentUrl = lessons![activeIndex!.value].url.obs;
      videoController!.value
          .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);

      Response<dynamic> response = await _learningService
          .nextLesson(lessons![activeIndex!.value].id.toString());

      // if (response) update();
    } else {
      isComplete = true.obs;
      update();
      MsgDialog.showMsgDialogs(
          context,
          'Congratulations',
          'Chúc mừng bạn đã hoàn thành khóa học!\nLàm bài kiểm tra ngay?',
          () => Get.toNamed(Routes.QUESTIONS));
      // Get.toNamed(Routes.QUESTIONS);
    }
  }
}
