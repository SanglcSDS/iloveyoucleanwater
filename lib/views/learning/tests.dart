import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/tests_controller.dart';
import 'package:iloveyoucleanwater/models/learning/test.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TestView extends GetView<TestController> {
  TestView({Key? key}) : super(key: key);
  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond:
        StopWatchTimer.getMilliSecFromMinute(30), // millisecond => minute.
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  Widget build(BuildContext context) {
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (_) => WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
            title: Text(
              'test_title'.tr,
              style: TextStyle(color: primaryColor),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Obx(
            () => controller.test == null
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: 32),
                      SizedBox(
                        height: 150,
                        child: StreamBuilder<int>(
                            stream: _stopWatchTimer.rawTime,
                            initialData: _stopWatchTimer.rawTime.value,
                            builder: (context, snap) {
                              final value = snap.data!;
                              final displayTime = StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false);
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      displayTime,
                                      style: const TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: 32),
                      Expanded(
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          children: List.generate(
                              controller.test!.value.questions!.length,
                              (index) => _questionView(
                                  controller.test!.value.questions![index],
                                  index)),
                        ),
                      ),
                      SizedBox(
                          height: 150,
                          child: Image.asset(
                            "assets/images/to-doi-giot-nuoc.png",
                            fit: BoxFit.fill,
                          )),
                      SizedBox(height: 32),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _questionView(Question question, int index) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            question.content,
            style: TextStyle(),
          ),
          Column(
            children: List.generate(question.answers!.length, (ansIndex) {
              return TextButton(
                child: Text(question.answers![ansIndex].content),
                onPressed: () {},
              );
            }),
          ),
          index == (controller.test!.value.questions!.length - 1)
              ? Theme(
                  data: ThemeData(primarySwatch: kPrimaryMaterial),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'test_end_test'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Theme(
                  data: ThemeData(primarySwatch: kPrimaryMaterial),
                  child: ElevatedButton(
                    onPressed: () async => await controller.pageController!
                        .nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.bounceInOut),
                    child: Text(
                      'test_next_page'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
