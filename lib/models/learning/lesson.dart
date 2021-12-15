class Lesson {
  late int id;
  late String title;
  late String url;
  late int time;
  late String language;
  late int referenceId;
  late bool statusWork; // null and 0 là chưa unlock

  Lesson({
    required this.id,
    required this.title,
    required this.url,
    required this.time,
    required this.language,
    required this.referenceId,
    required this.statusWork,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    url = json["url"];
    time = json["time"];
    language = json["language"];
    referenceId = json["reference_id"];
    if (json["status_work"] == 1) {
      statusWork = true;
    } else {
      statusWork = false;
    }
  }
}
