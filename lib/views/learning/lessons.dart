import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/models/learning/lesson.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/views/learning/lesson_detail.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LessonView extends StatelessWidget {
  List<Lesson>? items;
  LessonController controller = LessonController();
  LessonView({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Container(
                child: const Text(
                  'Tiến độ:',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                margin: const EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  // width: MediaQuery.of(context).size.width - 100,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.5,
                  center: const Text("50.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: ListLesson(lessons: items!)),
        controller.isComplete
            ? OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () => Get.toNamed(Routes.QUESTIONS),
                child: const Text(
                  'Đánh giá khóa học',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class ListLesson extends StatelessWidget {
  List<Lesson>? lessons;
  // bool isDetail;
  ListLesson({Key? key, this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons!.length,
      itemBuilder: (context, index) {
        Icon _lock = const Icon(Icons.lock, size: 16);
        if (lessons![index].unlocked) {
          _lock = const Icon(Icons.lock_open, size: 16);
        }
        return Container(
          margin: index == 0
              ? const EdgeInsets.only(bottom: 2, left: 5, right: 5)
              : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.play_circle),
                  title: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(lessons![index].title),
                  ),
                  onTap: () => {
                    Get.to(LessonDetailView(
                      lesson: lessons![index],
                    ))
                  },
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
                                  lessons![index].time,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Align(
                              child: Icon(
                                Icons.person,
                                size: 16,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Đã học: ' +
                                    lessons![index].totalStudent.toString() +
                                    ' học viên',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
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
    );
  }
}
