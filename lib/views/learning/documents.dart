import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class DocumentView extends GetView<DocumentController> {
  DocumentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (controller.documents != null && controller.documents!.isNotEmpty)
        ? GetBuilder(
            init: DocumentController(),
            builder: (_) => ListView.builder(
                itemCount: controller.documents!.length,
                itemBuilder: (context, index) {
                  return _fileItem(
                      context, controller.documents![index], index);
                }),
          )
        : const Center(
            child: Text('Không có tài liệu'),
          );
  }

  Widget _fileItem(BuildContext context, Document document, int index) {
    return Container(
      // margin: index == 0
      //     ? const EdgeInsets.only(bottom: 2, left: 5, right: 5)
      //     : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Image(
                image: AssetImage('assets/images/file_icon.jpg'),
              ),
              title: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(document.fileName!)),
              subtitle: Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.bottomLeft,
                child: Obx(() =>
                    controller.downloadValues[index]["isDownloading"] == false
                        ? controller.downloadValues[index]["localPath"] == ""
                            ? TextButton(
                                onPressed: () {
                                  // controller.downloadFile(document);
                                  controller.downloadFile(context,
                                      document: document, index: index);
                                },
                                child: const Text(
                                  'Tải xuống',
                                  style: TextStyle(color: primaryColor),
                                ),
                              )
                            : TextButton(
                                onPressed: () => controller.openFile(
                                    localPath: controller.downloadValues[index]
                                        ["localPath"]),
                                child: const Text(
                                  'Mở file',
                                  style: TextStyle(color: primaryColor),
                                ),
                              )
                        : Column(
                            children: [
                              SizedBox(
                                child: Text(controller.downloadValues[index]
                                    ["percentStr"]),
                              ),
                              SizedBox(
                                child: LinearProgressIndicator(
                                  color: primaryColor,
                                  value: controller.downloadValues[index]
                                      ["percent"],
                                ),
                              ),
                            ],
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
