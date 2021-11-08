import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/networking/network.dart';
import '../models/search_article_model.dart';
import '../widgets/article.dart';

NetworkFetcher networkFetcher = NetworkFetcher();

class SearchScreenNews extends StatelessWidget {
  SearchScreenNews({
    @required this.screenHeight,
    @required this.searchQuery,
  });
  final double screenHeight;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.568,
      child: FutureBuilder(
        future: networkFetcher.getSearchArticles(searchQuery),
        builder: (BuildContext context,
            AsyncSnapshot<List<SearchArticleModel>> snapshot) {
          if (snapshot.hasData) {
            List<SearchArticleModel> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Article(
                  title: articles[index].title,
                  imageURL: articles[index].imageURL,
                  publishedAt: articles[index].publishedAt,
                  url: articles[index].url,
                );
              },
            );
          }
          return SpinKitDoubleBounce(
            color: Colors.blueGrey[300],
          );
        },
      ),
    );
  }
}
