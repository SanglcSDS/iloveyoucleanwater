import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:iloveyoucleanwater/service/learning_service.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/msg_dialog.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart'
    as getx_response;

class DocumentController extends GetxController {
  late int _courseId;
  RxBool downloading = false.obs;
  RxList<Map<String, dynamic>> downloadValues = <Map<String, dynamic>>[].obs;
  RxList? documents;
  final GetStorage _box = GetStorage();
  final LearningService _learningService = Get.put(LearningService());

  @override
  void onInit() {
    super.onInit();
  }

  void loadDocuments(int courseId) async {
    // fetch api
    _courseId = courseId;
    getx_response.Response<dynamic> response =
        await _learningService.getDocumentByCouresId(courseId);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.body;
      List<Document> list = [];
      if (body.containsKey("data")) {
        for (var docJson in (body["data"] as List)) {
          list.add(Document.fromJson(docJson));
        }
      }
      documents = list.obs;

      var dir = await getApplicationDocumentsDirectory();
      List<Map<String, dynamic>> _values = <Map<String, dynamic>>[].obs;
      if (documents != null && documents!.isNotEmpty) {
        documents!.forEach((element) {
          String localPath = checkDocumentInStorage(element, dir.path);
          _values.add({
            "isDownloading": false,
            "percentStr": "",
            "percent": 0.0,
            "localPath": localPath,
          });
        });
      }
      downloadValues = _values.obs;
    }
    update();
  }

  String checkDocumentInStorage(Document document, String dirPath) {
    String localPath = "$dirPath/$_courseId/${document.fileName}";
    if (File(localPath).existsSync()) return localPath;
    return "";
  }

  Future<void> downloadFile(BuildContext context,
      {required Document document, required int index}) async {
    downloadValues[index]['isDownloading'] = true;
    update();
    Dio dio = Dio();
    String localPath = "";

    try {
      var dir = await getApplicationDocumentsDirectory();
      bool directoryExists = await Directory(dir.path).exists();
      if (!directoryExists) {
        Directory(dir.path).create();
      }
      localPath = "${dir.path}/$_courseId/${document.fileName}";
      await dio.download(
        document.link,
        "${dir.path}/$_courseId/${document.fileName}",
        onReceiveProgress: (rec, total) {
          var percent = rec / total;
          downloadValues[index]['percent'] = percent;
          downloadValues[index]['percentStr'] =
              'document_progressing'.tr + ' ${(percent * 100).floor()} %';
          update();
        },
      );
      downloadValues[index]['localPath'] = localPath;
    } catch (e) {
      debugPrint(e.toString());
      MsgDialog.showWarningDialogs(
          context, "error".tr, "document_download_fail".tr);
    }

    downloadValues[index]['isDownloading'] = false;
    update();
  }

  Future openFile({required String localPath}) async {
    OpenFile.open(localPath);
  }
}
