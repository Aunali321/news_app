import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/networking/network.dart';
import 'package:news_app/widgets/article.dart';
import 'package:news_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkFetcher networkFetcher = NetworkFetcher();
  int currentIndex = 0;

  @override
  void initState() {
    networkFetcher.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            elevation: 50),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: "Trending",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Trending",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
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
              const SearchBar(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 450,
                child: FutureBuilder(
                  future: networkFetcher.getArticles(),
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
                          );
                        },
                      );
                    }
                    return SpinKitDoubleBounce(
                      color: Colors.blueGrey[300],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
