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
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:
              const Text('Danh sách khóa học', style: TextStyle(color: kGrey1)),
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
                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                  width: 5 * (MediaQuery.of(context).size.width / 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      primary: kBlue1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Bạn phải đăng nhập để tham gia các khóa học.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w400,
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
              int _lessonCount = _controller.courses[index].lessons!.length;
              return Container(
                margin: index <= 1
                    ? const EdgeInsets.only(
                        top: 10, bottom: 2, left: 5, right: 5)
                    : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _controller
                          .popToLessonViews(_controller.courses[index]),
                      child: Card(
                        color: _controller.randomColor(),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              alignment: Alignment.topLeft,
                              child: Text(
                                _controller.courses[index].title,
                                style: const TextStyle(
                                    color: kBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 15),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        _lessonCount.toString() + ' bài học',
                                        style: const TextStyle(
                                            color: kBlack,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      )),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 15, right: 15),
                                      alignment: Alignment.bottomRight,
                                      child: const Icon(
                                        Icons.menu_book_outlined,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
