class QuotesModel {
  final String content;
  final String author;
  final List<String> tags;

  QuotesModel({
    required this.content,
    required this.author,
    required this.tags,
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "author": author,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
