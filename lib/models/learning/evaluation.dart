class Evaluation {
  late int id;
  late int type; // 1 - tiêu đề; 2 - câu trả lời
  late int isOther; // 1 - text; 2 - textfield
  String? content;

  Evaluation({
    required this.id,
    required this.type,
    required this.isOther,
    this.content,
  });

  Evaluation.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    isOther = json["is_other"];
    content = json["content"];
  }
}
