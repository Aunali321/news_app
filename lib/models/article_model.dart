class ArticleModel {
  String title;
  String author;
  String url;
  String publishedAt;
  String imageURL;
  String topic;

  ArticleModel({
    this.title,
    this.author,
    this.url,
    this.publishedAt,
    this.imageURL,
    this.topic,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String,
      author: json['author'] as String,
      url: json['url'] as String,
      imageURL: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      topic: json['topic'] as String,
    );
  }
}
