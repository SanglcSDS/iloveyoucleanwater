import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LessonView extends StatelessWidget {
  LessonView({Key? key}) : super(key: key);
  final LessonController controller = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'course_progress'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          // width: MediaQuery.of(context).size.width - 100,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: controller.percent!.value,
                          center: Text(controller.percentStr!.value),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.lessons!.isEmpty
                      ? const SizedBox()
                      : ListLesson(
                          lessons: controller.lessons!,
                          activeIndex: controller.activeIndex!.value,
                        ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => Container(
            child: controller.isComplete.value
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          alignment: Alignment.center,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () {
                              controller.routeTest();
                            },
                            child: Text(
                              'course_quiz'.tr,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          alignment: Alignment.center,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            onPressed: () => Get.toNamed(Routes.EVALUATIONS),
                            child: Text(
                              'course_rate'.tr,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        )
      ],
    );
  }
}

class ListLesson extends StatelessWidget {
  List<Lesson>? lessons;
  int? activeIndex;
  ListLesson({Key? key, this.lessons, this.activeIndex}) : super(key: key);
  final LessonController _controller = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        lessons!.length,
        (index) {
          Icon _lock = const Icon(Icons.lock, size: 16);
          if (lessons![index].statusWork) {
            _lock = const Icon(Icons.lock_open, size: 16);
          }
          return Container(
            margin: index == 0
                ? const EdgeInsets.only(bottom: 2, left: 5, right: 5)
                : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Card(
              color: activeIndex == index ? primaryColor : Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.play_circle,
                        size: 40,
                      ),
                    ),
                    title: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(lessons![index].title),
                    ),
                    onTap: () =>
                        _controller.changeLesson(lessons![index], index),
                    subtitle: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Icon(
                                    Icons.timer,
                                    size: 16,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    lessons![index].time.toString(),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     const Align(
                          //       child: Icon(
                          //         Icons.person,
                          //         size: 16,
                          //       ),
                          //     ),
                          //     Container(
                          //       alignment: Alignment.bottomCenter,
                          //       margin:
                          //           const EdgeInsets.only(left: 5, right: 10),
                          //       child: Text(
                          //         'Đã học: ' +
                          //             lessons![index].totalStudent.toString() +
                          //             ' học viên',
                          //         style: const TextStyle(fontSize: 14),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: _lock,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
