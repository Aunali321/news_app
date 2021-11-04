class SearchArticleModel {
  String title;
  String author;
  String url;
  String publishedAt;
  String imageURL;
  String topic;

  SearchArticleModel({
    this.title,
    this.author,
    this.url,
    this.publishedAt,
    this.imageURL,
    this.topic,
  });

  factory SearchArticleModel.fromJson(Map<String, dynamic> json) {
    return SearchArticleModel(
      title: json['title'] as String,
      author: json['author'] as String,
      url: json['link'] as String,
      imageURL: json['media'] as String,
      publishedAt: json['published_date'] as String,
      topic: json['topic'] as String,
    );
  }
}
