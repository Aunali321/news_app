import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/country_model.dart';
import 'package:provider/provider.dart';
import '../models/article_model.dart';
import '../models/search_article_model.dart';

String category = "technology";
String trendingCategory = "technology";

class NetworkFetcher {
  Future<List<ArticleModel>> getArticles(
      BuildContext context, String category) async {
    final selectedCountry = Provider.of<CountryModel>(context).selectedCountry;
    String selectedCategory = category;

    var response = await http.get(
      Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/$selectedCategory/$selectedCountry.json"),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      //   print(body);
      return articles;
    } else {
      print("Error getting news:  ${response.statusCode}");
      return [];
    }
  }

  Future<List<SearchArticleModel>> getSearchArticles(String searchQuery) async {
    var response = await http.get(
      Uri.parse(
          "https://free-news.p.rapidapi.com/v1/search?q=${searchQuery}&lang=en"),
      headers: {
        "x-rapidapi-host": "free-news.p.rapidapi.com",
        "x-rapidapi-key": "b8dbf08bbamshfa839ce8398d8f7p13ed2fjsn80ee58a61a8d"
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<SearchArticleModel> articles = body
          .map((dynamic item) => SearchArticleModel.fromJson(item))
          .toList();
      return articles;
    } else {
      print("Error getting searched news: ${response.statusCode}");
      return [];
    }
  }

  Future<List<ArticleModel>> getTrendingArticles(String category) async {
    String selectedCategory = category;

    var response = await http.get(
      Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/$selectedCategory/in.json"),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      return articles;
    } else {
      print("Error getting treding news: ${response.statusCode}");
      return [];
    }
  }
}
