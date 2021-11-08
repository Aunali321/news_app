import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/networking/network.dart';
import 'package:news_app/widgets/seach_news.dart';
import 'package:news_app/widgets/search_bar.dart';

NetworkFetcher networkFetcher = NetworkFetcher();

void getSearchQuery(String query) {}

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                SearchBar(
                  queryPassed: (String searchQuery) {
                    setState(() {
                      query = searchQuery;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchScreenNews(
                    screenHeight: screenHeight, searchQuery: query),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
