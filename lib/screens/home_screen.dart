import 'package:flutter/material.dart';
import 'package:news_app/networking/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/article_model.dart';
import '../widgets/article.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkFetcher networkFetcher = NetworkFetcher();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: screenHeight * 1,
      child: FutureBuilder(
        future: networkFetcher.getArticles(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel> articles = snapshot.data;
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
