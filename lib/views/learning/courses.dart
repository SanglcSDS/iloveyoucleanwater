import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class CourseView extends StatelessWidget {
  final _controller = Get.put(CourseController());
  CourseView({Key? key}) : super(key: key);
  RxBool _isLogged = false.obs;

  @override
  Widget build(BuildContext context) {
    _isLogged = _controller.isLogged.value.obs;
    return GetBuilder<CourseController>(
      init: CourseController(),
      initState: (_) => _controller.initData(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('course'.tr, style: TextStyle(color: kGrey1)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: kDirtyWhite,
        body: !_isLogged.value
            ? _beforeLogin(context)
            : Obx(() => _afterLogin(context)),
      ),
    );
  }

  Widget _beforeLogin(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/bgmain.png")),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Theme(
                    data: ThemeData(primarySwatch: kPrimaryMaterial),
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   elevation: 5.0,
                      // ),
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'login_btn'.tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'login_require'.tr,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _afterLogin(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Wrap(
          children: List.generate(
            _controller.courses.length,
            (index) {
              // int _lessonCount = _controller.courses[index].lessons!.length;
              int _lessonCount = 4;
              return Container(
                margin: index <= 1
                    ? const EdgeInsets.only(
                        top: 10, bottom: 2, left: 5, right: 5)
                    : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 3,
                child: GestureDetector(
                  onTap: () =>
                      _controller.popToLessonViews(_controller.courses[index]),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            _controller.getDropletIcon(index),
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              alignment: Alignment.topLeft,
                              child: Text(
                                _controller.courses[index].title,
                                style: const TextStyle(
                                    color: kBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Text(
                                    '${_lessonCount.toString()} ' +
                                        'lesson_lower_case'.tr,
                                    style: const TextStyle(
                                        color: kBlack,
                                        fontWeight: FontWeight.w300),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
