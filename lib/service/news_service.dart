import 'package:get/get.dart';

class NewsService extends GetConnect {
  Future<Response> GetAll() {
    return get("https://my-grocery-strapi.herokuapp.com/home-carousels");
  }

  Future<Response> getNewAll(int page) {
    return get(
        "http://112.78.4.235/api/posts/list?pageLength=3&language=vi&page=$page&categoryId=");
  }

  Future<Response> GetNews() {
    return get(
        "https://newsapi.org/v2/everything?q=apple&from=2021-12-04&to=2021-12-04&sortBy=popularity&apiKey=801b632a7c434afa85a57d0ea98eb846");
  }

  static var baseURL = 'https://my-grocery-strapi.herokuapp.com';

  Future<dynamic> fetchItem(int start) {
    return get(
      '$baseURL/items?_start=$start&_limit=10',
    );
  }
}
