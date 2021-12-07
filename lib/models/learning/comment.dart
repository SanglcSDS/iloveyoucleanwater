class Comment {
  String comment;
  String time;

  Comment({
    required this.comment,
    required this.time,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : comment = json["comment"],
        time = json["time"];
}
