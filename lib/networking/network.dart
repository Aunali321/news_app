import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/article_model.dart';

class NetworkFetcher {
  Future<List<ArticleModel>> getArticles() async {
    Response response = await Dio().request(
      "https://free-news.p.rapidapi.com/v1/search?q=Elon%20Musk&lang=en",
      options: Options(headers: {
        "x-rapidapi-host": "free-news.p.rapidapi.com",
        "x-rapidapi-key": "b8dbf08bbamshfa839ce8398d8f7p13ed2fjsn80ee58a61a8d"
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.data);
      List<dynamic> body = json['articles'];
      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      print(articles);
      return articles;
    } else {
      print(response.statusCode);
    }
  }
}
