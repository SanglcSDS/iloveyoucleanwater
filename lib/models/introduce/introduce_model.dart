class IntroduceModel {
  int id;
  String title;
  String titleMenu;
  String description;

  IntroduceModel(
      {required this.id,
      required this.title,
      required this.titleMenu,
      required this.description});

  factory IntroduceModel.fromJson(Map<String, dynamic> json) => IntroduceModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? "",
        titleMenu: json['title_menu'] ?? "",
        description: json['description'] ?? "",
      );
}
