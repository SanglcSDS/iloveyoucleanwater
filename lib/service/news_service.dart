import 'package:get/get.dart';

class NewsService extends GetConnect {
  Future<Response> getNewAll(int page, int id) {
    return get(
        "http://112.78.4.235/api/posts/list?pageLength=5&language=vi&page=$page&categoryId=$id");
  }
}
