import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseView extends StatelessWidget {
  final controller = Get.put(CourseController());
  CourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(
        //   color: kGrey1,
        // ),
        title:
            const Text('Danh sách khóa học', style: TextStyle(color: kGrey1)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: kDirtyWhite,
      body: ListView.builder(
        itemCount: (controller.courses.length),
        itemBuilder: (contex, index) {
          return Container(
            margin: index == 0
                ? const EdgeInsets.only(top: 5, bottom: 2, left: 5, right: 5)
                : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              child: ListTile(
                onTap: () => Get.toNamed(Routes.LEARNING),
                leading: const Icon(Icons.ac_unit),
                title: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        controller.courses[index].title,
                        style: const TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 5, right: 10),
                      child: LinearPercentIndicator(
                        // width: MediaQuery.of(context).size.width * 2 / 3,
                        lineHeight: 5.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.lightBlue,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 2),
                      child: Text("50% Hoàn thành",
                          style: const TextStyle(color: kGrey1, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
