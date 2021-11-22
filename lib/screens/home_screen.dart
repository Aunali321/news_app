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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                  ChipModel.categories.length,
                  (int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 2.0,
                      ),
                      child: ChoiceChip(
                        label: ChipModel.categories[index].label,
                        selected: ChipModel.categories[index].isSelected,
                        backgroundColor:
                            ChipModel.categories[index].backgroundColor,
                        shape: StadiumBorder(side: BorderSide()),
                        selectedColor: Colors.lightBlue[200],
                        disabledColor: Colors.grey,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        onSelected: (bool value) {
                          setState(() {
                            ChipModel.categories[index].isSelected = value;
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                // height: mediaQuery.size.height -
                //     mediaQuery.padding.top -
                //     appBar.preferredSize.height -
                //     mediaQuery.padding.bottom -
                //     200,
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
            ),
          ],
        ),
      ),
    );
  }
}
