import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:intl/intl.dart';

class CommentController extends GetxController {
  late String comment;

  late List<Comment> comments;

  @override
  void onInit() {
    comments = [Comment(comment: 'Bổ ích', time: '2021-12-01 10:49:04')];
    super.onInit();
  }

  writeComment(value) {
    comment = value;
    comments.add(Comment(
        comment: value,
        time: DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now())));
    update();
  }
}
