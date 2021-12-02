import 'package:flutter/material.dart';
import 'package:news_app/networking/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/widgets/choice_chips.dart';
import '../models/article_model.dart';
import '../widgets/article.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget _loadingAnimation() {
  return Center(
    child: SpinKitDoubleBounce(
      color: Colors.blueGrey[300],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkFetcher networkFetcher = NetworkFetcher();
  String selectedChip = "technology";

  Future<void> getCategory(String category) async {
    await setState(() {
      selectedChip = category;
    });
    _loadingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Latest News'),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      centerTitle: Theme.of(context).appBarTheme.centerTitle,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      elevation: 2.0,
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            ChoiceChips(chipCallback: getCategory),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: FutureBuilder(
                  future: networkFetcher.getArticles(context, selectedChip),
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
                    return _loadingAnimation();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
