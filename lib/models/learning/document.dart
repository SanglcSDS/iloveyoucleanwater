class Document {
  late int id;
  late String type;
  late String title;
  late String url;
  late String fileName;
  String? localPath;
  // bool? isLoading;
  // double? percent;
  // String? percentStr;

  Document({
    required this.id,
    required this.type,
    required this.title,
    required this.url,
    required this.fileName,
  });

  Document.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    title = json["title"];
    url = json["url"];
    fileName = json["fileName"];
  }

  set setLocalPath(String value) {
    localPath = value;
  }

  // set setIsLoading(bool value) {
  //   isLoading = value;
  // }

  // set setPercent(double value) {
  //   percent = value;
  // }

  // set setPercentStr(String value) {
  //   percentStr = value;
  // }
}
