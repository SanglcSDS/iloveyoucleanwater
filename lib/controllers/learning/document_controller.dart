import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DocumentController extends GetxController {
  RxBool downloading = false.obs;
  RxList<Map<String, dynamic>> downloadValues = <Map<String, dynamic>>[].obs;
  RxList<Document>? documents;
  final GetStorage _box = GetStorage();

  @override
  void onInit() {
    loadDocuments();
    super.onInit();
  }

  void loadDocuments() async {
    // List<Document> _listDocs = <Document>[];
    // if (_box.hasData("documents")) {
    //   var _docJson = _box.read("documents");
    //   String _dir = (await getApplicationDocumentsDirectory()).path;

    //   _docJson.forEach((e) async {
    //     Document item = Document.fromJson(e);
    //     String filePath = '$_dir/${item.fileName}';
    //     if (await File(filePath).exists()) {
    //       item.setLocalPath = filePath;
    //     }
    //     _listDocs.add(Document.fromJson(e));

    //   });
    // }
    List<Map<String, dynamic>> _values = <Map<String, dynamic>>[].obs;
    documents!.forEach((element) {
      _values.add({
        "isDownloading": false,
        "percentStr": "",
        "percent": 0.0,
        "localPath": ""
      });
    });
    downloadValues = _values.obs;
    update();
  }

  Future<void> downloadFile(
      {required Document document, required int index}) async {
    downloadValues[index]['isDownloading'] = true;
    update();
    Dio dio = Dio();
    String localPath = "";

    try {
      var dir = await getApplicationDocumentsDirectory();
      localPath = "${dir.path}/${document.fileName}";
      await dio.download(
        document.url,
        "${dir.path}/${document.fileName}",
        onReceiveProgress: (rec, total) {
          var percent = rec / total;
          downloadValues[index]['percent'] = percent;
          downloadValues[index]['percentStr'] =
              'Downloading... ${(percent * 100).floor()} %';
          update();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    downloadValues[index]['localPath'] = localPath;
    downloadValues[index]['isDownloading'] = false;
    update();
  }

  // Future openFile({required Document document, required int index}) async {
  //   downloadValues[index]['isDownloading'] = true;
  //   update();
  //   await downloadFile(document);
  //   var dir = await getApplicationDocumentsDirectory();
  //   if (file == null) return;

  //   OpenFile.open('${dir.path}/${document.fileName}');
  // }

  Future openFile({required String localPath}) async {
    OpenFile.open(localPath);
  }
}
