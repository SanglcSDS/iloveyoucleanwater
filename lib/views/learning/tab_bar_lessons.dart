import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/learning/comments.dart';
import 'package:iloveyoucleanwater/views/learning/documents.dart';
import 'package:iloveyoucleanwater/views/learning/lessons.dart';

class LearningView extends StatelessWidget {
  final controller = Get.put(LessonController());
  LearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-learning',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kGrey1,
              ),
              onPressed: () => Get.back(result: LearningView()),
            ),
            backgroundColor: Colors.white,
            title: const Text(
              'Giới thiệu chung về E-learning',
              style: TextStyle(color: kGrey1),
            ),
            bottom: const TabBar(
              labelColor: Colors.lightBlue,
              unselectedLabelColor: kGrey1,
              tabs: [
                Tab(text: 'Bài học'),
                Tab(text: 'Bình luận'),
                Tab(text: 'Tài liệu'),
              ],
            ),
          ),
          backgroundColor: kDirtyWhite,
          body: TabBarView(
            children: [
              LessonView(items: controller.items),
              CommentView(),
              DocumentView(
                documents: controller.documents,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
