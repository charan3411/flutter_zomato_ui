import 'dart:convert';

List<PostModel> postFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromMap(x)));

class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
}
