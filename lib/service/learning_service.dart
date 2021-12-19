import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:get/get_connect/http/src/response/response.dart' as getx_resp;
import 'package:dio/src/response.dart' as dio_resp;
import 'package:dio/src/form_data.dart' as dio_fd;

class LearningService extends GetConnect {
  Future<getx_resp.Response> getCourses() {
    return get("${Constants.SERVER_URL}/courses?language=${'locales'.tr}",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
  }

  Future<getx_resp.Response> getLessonByCoureseId(int courseId) {
    return get("${Constants.SERVER_URL}/auth/courses/detail?id=$courseId",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getDocumentByCouresId(int courseId) {
    return get("${Constants.SERVER_URL}/courses/documents?id=$courseId",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
  }

  Future<getx_resp.Response> nextLesson(String nextLessonId) {
    Map<String, String> data = {
      "next_lesson_id": nextLessonId,
      "language": 'locales'.tr
    };
    return post("${Constants.SERVER_URL}/auth/courses/next-lesson", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getCommentByCourseId(int courseId) {
    return get("${Constants.SERVER_URL}/auth/comments/get?course_id=$courseId",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> postComment(int courseId, String comment) {
    Map<String, dynamic> data = {"course_id": courseId, "comment": comment};
    return post("${Constants.SERVER_URL}/auth/comments/post-comments", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getTest(int courseId) {
    Map<String, String> data = {
      "course_id": courseId.toString(),
      "language": 'locales'.tr
    };
    return post("${Constants.SERVER_URL}/auth/courses/get-test", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getEvaluation() {
    Map<String, String> data = {"language": 'locales'.tr};
    return post("${Constants.SERVER_URL}/auth/evaluations/get", data, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${GetStorage().read('token')}',
    });
  }

  Future<dio_resp.Response> postTest(Map<String, dynamic> body) {
    dio_fd.FormData data = dio_fd.FormData.fromMap(body);
    return Dio().post("${Constants.SERVER_URL}/auth/courses/post-test",
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        }));
  }

  Future<dio_resp.Response> postEvaluation(Map<String, dynamic> body) {
    dio_fd.FormData data = dio_fd.FormData.fromMap(body);
    return Dio().post("${Constants.SERVER_URL}/auth/evaluations/post-evaluations",
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        }));
  }

}
