import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/search_article_model.dart';
import 'package:news_app/networking/network.dart';
import 'package:news_app/widgets/article.dart';
import 'package:news_app/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  NetworkFetcher networkFetcher = NetworkFetcher();

  @override
  void initState() {
    networkFetcher.getSearchArticles("Meta");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                padding: EdgeInsets.zero,
                iconSize: 28,
                alignment: Alignment.centerLeft,
              ),
              const Text(
                "Discover",
                style: kBoldText,
              ),
              const Text(
                "News from all over the world",
                style: kSmallText,
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBar(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: screenHeight * 0.568,
                child: FutureBuilder(
                  future: networkFetcher.getSearchArticles("Meta"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
