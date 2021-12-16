import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:get/get_connect/http/src/response/response.dart' as getx_resp;
import 'package:dio/src/response.dart' as dio_resp;
import 'package:dio/src/form_data.dart' as dio_fd;

class LearningService extends GetConnect {
  String _getLanguage() {
    String _language = defaultLanguage;
    if (GetStorage().hasData("language"))
      _language = GetStorage().read("language");
    return _language;
  }

  Future<getx_resp.Response> getCourses() {
    return get("${Constants.SERVER_URL}/courses?language=${_getLanguage()}",
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
      "language": _getLanguage()
    };
    return post("${Constants.SERVER_URL}/auth/courses/next-lesson", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getTest(int courseId) {
    Map<String, String> data = {
      "course_id": courseId.toString(),
      "language": _getLanguage()
    };
    return post("${Constants.SERVER_URL}/auth/courses/get-test", data,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        });
  }

  Future<getx_resp.Response> getEvaluation() {
    Map<String, String> data = {"language": _getLanguage()};
    return post("${Constants.SERVER_URL}/auth/evaluations/get", data, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${GetStorage().read('token')}',
    });
  }

  Future<dio_resp.Response> postTest(Map<String, String> body) {
    dio_fd.FormData data = dio_fd.FormData.fromMap(body);
    return Dio().post("${Constants.SERVER_URL}/auth/courses/post-test",
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': '${GetStorage().read('token')}',
        }));
  }
}
