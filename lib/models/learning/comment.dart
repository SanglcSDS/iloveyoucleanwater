class Comment {
  String name;
  String content;

  Comment({
    required this.name,
    required this.content,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        content = json["content"];
}
