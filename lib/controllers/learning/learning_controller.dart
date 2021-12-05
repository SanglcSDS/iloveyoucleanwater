import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloveyoucleanwater/models/home/item.dart';
import 'package:iloveyoucleanwater/service/news_service.dart';

class LearningController extends GetxController {
  final NewsService provider = NewsService();
  RxBool isLoading = true.obs;
  RxBool isAddLoading = false.obs;
  var itemList = List<Item>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchItem(0);
    super.onInit();
  }

  void fetchItem(int start) async {
    try {
      isLoading(true);
      itemList.clear();
      Response<dynamic> response = await provider.fetchItem(start);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        if (jsonString != null) {
          jsonString.forEach((e) {
            itemList.add(Item.fromJson(e));
          });
        }
      }
    } finally {
      isLoading(false);
    }
  }

//  void getNews() async {
//     try {
//       isLoading = true;
//       update();
//       Response<dynamic> _data = await provider.GetNews();
//       if (_data.statusCode == 200) {
//         var jsonString = _data.body["articles"];
//         if (jsonString != null) {
//           jsonString.forEach((e) {
//             newsDemo.add(NewDemo.fromJson(e));
//           });
//         }
//       }
//     } finally {
//       isLoading = false;
//       update();
//       print('data fetch done');
//     }
//   }
  void addItem(int start) async {
    try {
      isAddLoading(true);
      var response = await provider.fetchItem(start);
      if (response.statusCode == 200) {
        List<Item> items = itemFromJson(response.body);
        itemList.addAll(items);
      }
    } finally {
      isAddLoading(false);
    }
  }
}
