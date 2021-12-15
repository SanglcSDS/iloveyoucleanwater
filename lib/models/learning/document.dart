class Document {
  late String link;
  String? fileName;
  String? localPath;

  Document({
    required this.link,
  });

  Document.fromJson(Map<String, dynamic> json) {
    link = json["link"];
    int _titleIndex = link.lastIndexOf('/') + 1;
    fileName = link.substring(_titleIndex, link.length);
  }

  set setFileName(String value) {
    fileName = value;
  }

  set setLocalPath(String value) {
    localPath = value;
  }
}
