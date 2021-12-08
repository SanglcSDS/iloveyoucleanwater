import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:path_provider/path_provider.dart';

class DocumentController extends GetxController {
  RxBool downloading = false.obs;
  RxString progressString = "".obs;
  RxList<Document>? documents;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> downloadFile(Document document) async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      debugPrint("dir" + dir.path);
      await dio.download(
        document.url,
        "${dir.path}/${document.fileName}",
        onReceiveProgress: (rec, total) {
          debugPrint("Rec: $rec , Total: $total");

          document.isLoading = true;
          progressString = (((rec / total) * 100).toStringAsFixed(0) + "%").obs;
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    document.isLoading = false;
    progressString = "Completed".obs;

    debugPrint("Download completed");
  }
}
