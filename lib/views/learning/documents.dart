import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/learning/document.dart';

class DocumentView extends StatelessWidget {
  List<Document>? documents;
  DocumentView({Key? key, this.documents}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (documents != null && documents!.isNotEmpty)
        ? ListView.builder(
            itemCount: documents!.length,
            itemBuilder: (context, index) {
              return _fileItem(documents![index]);
            })
        : const Center(
            child: Text('Không có tài liệu'),
          );
  }

  Widget _fileItem(Document document) {
    return Card(
      child: ListTile(
          leading: const Image(
            image: AssetImage('assets/images/pdf_file_icon.png'),
          ),
          title: Text(document.title),
          subtitle: Container(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {}, child: const Text('Tải xuống')))),
    );
  }
}
