class Document {
  String type;
  String title;
  String url;
  String fileName;

  Document({
    required this.type,
    required this.title,
    required this.url,
    required this.fileName,
  });

  Document.fromJson(Map<String, dynamic> json)
      : type = json["type"],
        title = json["title"],
        url = json["url"],
        fileName = json["fileName"];
}
