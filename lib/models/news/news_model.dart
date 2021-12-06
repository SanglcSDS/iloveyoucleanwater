class NewModel {
  int id;
  String title;
  String language;
  int status;
  String image;
  String description;
  String createdAt;
  String categoryTitle;

  NewModel(
      {required this.id,
      required this.title,
      required this.language,
      required this.status,
      required this.image,
      required this.description,
      required this.createdAt,
      required this.categoryTitle});

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        id: json['id'] ?? '' as int,
        title: json['title'] ?? '',
        language: json['language'] ?? '',
        status: json['status'] ?? '' as int,
        image: json['image'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['created_at'] ?? '',
        categoryTitle: json['category_title'] ?? '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['language'] = this.language;
    data['status'] = this.status;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['category_title'] = this.categoryTitle;
    return data;
  }
}
