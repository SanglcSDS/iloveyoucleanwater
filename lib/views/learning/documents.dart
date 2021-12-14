import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';

class DocumentView extends StatelessWidget {
  DocumentView({Key? key}) : super(key: key);
  final DocumentController _controller = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    return (_controller.documents != null && _controller.documents!.isNotEmpty)
        ? GetBuilder(
            init: DocumentController(),
            builder: (_) => ListView.builder(
                itemCount: _controller.documents!.length,
                itemBuilder: (context, index) {
                  return _fileItem(_controller.documents![index], index);
                }),
          )
        : const Center(
            child: Text('Không có tài liệu'),
          );
  }

  Widget _fileItem(Document document, int index) {
    return Container(
      margin: index == 0
          ? const EdgeInsets.only(bottom: 2, left: 5, right: 5)
          : const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Image(
                image: AssetImage('assets/images/pdf_file_icon.png'),
              ),
              title: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(document.fileName!)),
              subtitle: Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.bottomLeft,
                child: Obx(() =>
                    _controller.downloadValues[index]["isDownloading"] == false
                        ? _controller.downloadValues[index]["localPath"] == ""
                            ? TextButton(
                                onPressed: () {
                                  // controller.downloadFile(document);
                                  _controller.downloadFile(
                                      document: document, index: index);
                                },
                                child: const Text('Tải xuống'),
                              )
                            : TextButton(
                                onPressed: () => _controller.openFile(
                                    localPath: _controller.downloadValues[index]
                                        ["localPath"]),
                                child: const Text('Mở file'),
                              )
                        : Column(
                            children: [
                              SizedBox(
                                child: Text(_controller.downloadValues[index]
                                    ["percentStr"]),
                              ),
                              SizedBox(
                                child: LinearProgressIndicator(
                                  value: _controller.downloadValues[index]
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
