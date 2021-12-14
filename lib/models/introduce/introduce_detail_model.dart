class IntroduceDetialModel {
  int id;
  String title;
  String titleMenu;
  String description;
  String content;
  String language;
  int referenceId;

  IntroduceDetialModel(
      {required this.id,
      required this.title,
      required this.titleMenu,
      required this.description,
      required this.content,
      required this.language,
      required this.referenceId});

  factory IntroduceDetialModel.fromJson(Map<String, dynamic> json) =>
      IntroduceDetialModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? "",
        titleMenu: json['title_menu'] ?? "",
        description: json['description'] ?? "",
        content: json['content'] ?? "",
        language: json['language'] ?? "",
        referenceId: json['reference_id'] ?? 0,
      );
}
