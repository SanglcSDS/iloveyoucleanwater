import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';

class CommentController extends GetxController {
  RxList<Comment>? comments = <Comment>[].obs;
  final LearningService _learningService = LearningService();
  late int courseId;

  @override
  void onInit() {
    super.onInit();
  }

  void loadComments(int _courseId) async {
    courseId = _courseId;
    Response response = await _learningService.getCommentByCourseId(_courseId);
    if (response.statusCode == 200 && !response.body["error"]) {
      List<Comment> list = [];
      var data = response.body["data"] as List;
      for (Map<String, dynamic> item in data) {
        list.add(Comment.fromJson(item));
      }

      comments = list.obs;
      update();
    }
  }

  void writeComment(String value) async {
    if (value.length > 0) {
      await _learningService.postComment(courseId, value);
      loadComments(courseId);
      update();
    }
  }
}
