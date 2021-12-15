class BannerModel {
  int id;
  String title;
  String image;
  String url;
  String language;
  int referenceId;

  BannerModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.url,
      required this.language,
      required this.referenceId});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        image: json['image'] ?? '',
        url: json['url'] ?? '',
        language: json['language'] ?? '',
        referenceId: json['reference_id'] ?? '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['url'] = this.url;
    data['language'] = this.language;
    data['reference_id'] = this.referenceId;
    return data;
  }
}
