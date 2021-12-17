import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_detail_model.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/service/introduce_service.dart';

class IntroduceController extends GetxController {
  IntroduceService service = IntroduceService();

  late IntroduceModel introduceModel;
  RxList introduceProgram = <IntroduceDetialModel>[].obs;
  RxList introducePartner = <IntroduceDetialModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    //  GetIntroduces();
    isloadingIntroduce();
  }

  Future<void> isloadingIntroduce() async {
    if ('locales'.tr == "vi") {
      introduceProgram.clear();
      introducePartner.clear();
      GetDetialProgram(1);
      GetDetialPartner(3);
    } else {
      introduceProgram.clear();
      introducePartner.clear();
      GetDetialProgram(2);
      GetDetialPartner(4);
    }
  }
//   Future<void> GetIntroduces() async {
//     Response _data = await service.GetIntroduces();
//     if (_data.statusCode == 200) {
//       var jsonString = _data.body['data'];
//       if (jsonString != null) {
// introduceDetialModel.add(value) = IntroduceModel.fromJson(jsonString[0]).obs;
//       }
//     }
//     update();
//   }

  Future<void> GetDetialProgram(int id) async {
    Response _data = await service.GetDetailIntroduces(id);

    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      //  print(jsonString);
      if (jsonString != null) {
        introduceProgram.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  // final replaced = original.replaceAllMapped(
  //   RegExp(r'(<img[^>]+)(height=)', caseSensitive: false),
  //   (match) => match.group(1) + '_' + match.group(1),
  // );

  Future<void> GetDetialPartner(int id) async {
    Response _data = await service.GetDetailIntroduces(id);
    //  List<IntroduceDetialModel> listBanner = [];
    if (_data.statusCode == 200) {
      var jsonString = _data.body['data'];
      //  print(jsonString);
      if (jsonString != null) {
        // var replaced = _data.body['data']['content'].toString();
        // var aaa = pigLatin(_data.body['data']['content']);
        // print(aaa);
        // print("-----------------------------------------------");
        // print(_data.body['data']['content']);

        introducePartner.add(IntroduceDetialModel.fromJson(jsonString));
//pigLatin

        //listBanner.add(IntroduceDetialModel.fromJson(jsonString));
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
