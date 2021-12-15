class Course {
  late int id;
  late String title;
  late String language;
  late int referenceId;
  late String createAt;
  late int countUser;
  Course({
    required this.id,
    required this.title,
    required this.language,
    required this.referenceId,
    required this.createAt,
    required this.countUser,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    language = json["language"];
    referenceId = json["reference_id"];
    createAt = json["created_at"];
    countUser = json["count_user"];
  }
}
