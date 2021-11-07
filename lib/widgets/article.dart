import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () async {
                    print(url);
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: true,
                        forceWebView: false,
                        enableJavaScript: true,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    '$title',
                    maxLines: 3,
                    style: kArticleTitle,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Image(
                  image: CachedNetworkImageProvider(imageURL),
                  height: 75,
                  width: 120,
                  fit: BoxFit.fill,
                ),
                constraints: BoxConstraints(
                  maxHeight: 75,
                  maxWidth: 120,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
              '${publishedAt.substring(0, 10).split('-').reversed.join('-')}'),
        ),
        Divider(
          thickness: 0.5,
          color: Color(0x75000000),
        ),
      ],
    );
  }
}
