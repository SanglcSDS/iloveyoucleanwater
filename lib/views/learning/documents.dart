import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/document_controller.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';

class DocumentView extends StatelessWidget {
  DocumentView({Key? key}) : super(key: key);
  final DocumentController controller = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    return (controller.documents != null && controller.documents!.isNotEmpty)
        ? ListView.builder(
            itemCount: controller.documents!.length,
            itemBuilder: (context, index) {
              RxObjectMixin<Document> document =
                  controller.documents![index].obs;
              return Obx(() => _fileItem(document.value, index));
            })
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
        child: ListTile(
          leading: const Image(
            image: AssetImage('assets/images/pdf_file_icon.png'),
          ),
          title: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(document.title)),
          subtitle: Container(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {
                controller.downloadFile(document);
              },
              child: const Text('Tải xuống'),
            ),
          ),
        ),
      ),
    );
  }
}
