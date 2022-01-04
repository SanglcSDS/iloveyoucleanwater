import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/tests_controller.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonController extends GetxController {
  late String title;
  late RxInt courseId;
  RxBool isComplete = false.obs;
  RxDouble? percent;
  RxString? percentStr;
  RxList<Lesson>? lessons;
  Rx<Lesson>? currentLesson;
  RxInt? activeIndex;
  RxString? currentUrl;
  Rx<YoutubePlayerController>? videoController;
  final LearningService _learningService = Get.put(LearningService());
  final TestController _testController = Get.put(TestController());

  @override
  void onInit() {
    percent = 0.0.obs;
    percentStr = ('0% ' + 'course_percent'.tr).obs;
    super.onInit();
  }

  void onInitLesson(int course) async {
    EasyLoading.show(status: 'loadingText'.tr);
    courseId = course.obs;
    Response<dynamic> response =
        await _learningService.getLessonByCoureseId(course);
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
        if (countUnlockLesson == list.length)
          isComplete = true.obs;
        else
          isComplete = false.obs;
        currentUrl = currentLesson!.value.url.obs;
        percent = (countUnlockLesson / list.length).obs;
        percentStr =
            ('${(percent! * 100).floor()} % ' + 'course_percent'.tr).obs;

        videoController = new YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(currentUrl!.value)!,
          flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            autoPlay: true,
          ),
        ).obs;
      }
      update();
    } else {
      Get.offNamed(Routes.LOGIN);
    }
    EasyLoading.dismiss();
  }

  void changeLesson(Lesson lesson, int index) {
    EasyLoading.show(status: "lesson_loading".tr);
    if (lesson.statusWork) {
      currentLesson = lesson.obs;
      currentUrl = lesson.url.obs;
      activeIndex = index.obs;
      videoController!.value
          .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
      update();
    }
    EasyLoading.dismiss();
  }

  void videoEnded(context) async {
    int length = lessons!.length - 1;
    if (activeIndex!.value < length) {
      activeIndex = (activeIndex!.value + 1).obs;
      Response<dynamic> response = await _learningService
          .nextLesson(lessons![activeIndex!.value].id.toString());

      if (response.statusCode == 200 && response.body["error"] == false) {
        currentLesson = lessons![activeIndex!.value].obs;
        currentUrl = lessons![activeIndex!.value].url.obs;
        videoController!.value
            .load(YoutubePlayer.convertUrlToId(currentUrl!.value)!);
        lessons![activeIndex!.value].statusWork = true;
        if (response.body["status_show_test"] == 1) {
          isComplete = true.obs;
        }
      }

      update();
    } else {
      isComplete = true.obs;
      update();
    }
  }

  void routeTest() {
    videoController!.value.pause();
    update();
    _testController.loadTest(courseId.value);
    update();
    Get.toNamed(Routes.TESTS);
  }

  @override
  void onClose() {
    isComplete = false.obs;
    videoController!.value.dispose();
    lessons = <Lesson>[].obs;
    super.onClose();
  }
}
