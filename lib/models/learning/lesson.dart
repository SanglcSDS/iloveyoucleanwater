class Lesson {
  String title;
  String time;
  int totalStudent;
  bool unlocked;
  String url;

  Lesson({
    required this.title,
    required this.time,
    required this.totalStudent,
    required this.unlocked,
    required this.url,
  });

  Lesson.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        time = json["time"],
        totalStudent = json["totalStudent"],
        unlocked = json["unlocked"],
        url = json["url"];
}
