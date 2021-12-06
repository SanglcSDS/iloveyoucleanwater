import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:iloveyoucleanwater/models/learning/course.dart';

class CourseController extends GetxController {
  List<Course> courses = [
    Course(title: 'Giới thiệu chung về khóa học E-learning'),
    Course(title: 'Chủ đề 1: Nước bị làm sao thế?'),
    Course(title: 'Chủ đề 2: Chúng ta có thể làm gì?'),
    Course(title: 'Thống kê'),
  ];

  List<Comment> comments = [
    Comment(comment: 'Bổ ích', time: '2021-12-01 10:49:04')
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
