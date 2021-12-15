import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class LearningService extends GetConnect {
  Future<Response> getCourses() {
    String language = "vi";
    return get("${Constants.SERVER_URL}/courses?language=$language", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<Response> getLessonByCoureseId(int courseId) {
    return get("${Constants.SERVER_URL}/auth/courses/detail?id=$courseId",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<Response> getDocumentByCouresId(int courseId) {
    return get("${Constants.SERVER_URL}/courses/documents?id=$courseId",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
  }

  Future<Response> nextLesson(String nextLessonId) {
    Map<String, String> data = {
      "next_lesson_id": nextLessonId,
      "language": "vi"
    };
    return post("${Constants.SERVER_URL}/auth/courses/next-lesson", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<Response> getTest(int courseId) {
    Map<String, String> data = {
      "course_id": courseId.toString(),
      "language": "vi"
    };
    return post("${Constants.SERVER_URL}/auth/courses/get-test", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }
}
