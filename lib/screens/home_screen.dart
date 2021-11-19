import 'package:flutter/material.dart';
import 'package:news_app/models/chips_model.dart';
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

  List<ChipModel> categories = [
    ChipModel(
      label: "Technology",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "Business",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "Science",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "Health",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "General",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "Entertainment",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: "Sports",
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
  ];

  List<Widget> categoryChips() {
    List<Widget> chips = [];
    for (int i = 0; i < categories.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
        child: FilterChip(
          label: Text(categories[i].label),
          selected: categories[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              categories[i].isSelected = value;
            });
          },
          backgroundColor: categories[i].backgroundColor,
          shape: StadiumBorder(side: BorderSide()),
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
            Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: categoryChips(),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              height: mediaQuery.size.height -
                  mediaQuery.padding.top -
                  appBar.preferredSize.height -
                  mediaQuery.padding.bottom,
              child: FutureBuilder(
                future: networkFetcher.getArticles(context),
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
