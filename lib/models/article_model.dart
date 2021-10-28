class ArticleModel {
  String title;
  String author;
  String media;
  String publishedDate;
  String cleanURL;
  String topic;

  ArticleModel({
    this.title,
    this.author,
    this.media,
    this.publishedDate,
    this.cleanURL,
    this.topic,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String,
      author: json['author'] as String,
      media: json['media'] as String,
      publishedDate: json['publishedDate'] as String,
      cleanURL: json['cleanURL'] as String,
      topic: json['topic'],
    );
  }
}
