import 'package:flutter/material.dart';
import 'package:news_app/networking/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/article_model.dart';
import '../widgets/article.dart';

class TrendingScreen extends StatefulWidget {
  TrendingScreen({Key key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  NetworkFetcher networkFetcher = NetworkFetcher();
  @override
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Trending News'),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        elevation: 3.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: screenHeight * 0.825,
              child: FutureBuilder(
                future: networkFetcher.getTrendingArticles(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ArticleModel>> snapshot) {
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
            ),
          ],
        ),
      ),
    );
  }
}
