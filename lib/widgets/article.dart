import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class Article extends StatelessWidget {
  const Article(
      {Key key,
      this.title,
      this.imageURL,
      this.publishedAt,
      this.author,
      this.url})
      : super(key: key);

  final String title;
  final String imageURL;
  final String publishedAt;
  final String author;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              '$title',
              maxLines: 3,
              style: kArticleTitle,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Image.network(
            '$imageURL',
            height: 110,
            width: 120,
          ),
        ),
      ],
    );
  }
}
