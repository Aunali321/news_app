import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NetworkFetcher {
  Future<List<ArticleModel>> getArticles() async {
    // Dio dio = Dio();
    // Response response = await dio.request(
    //   "https://free-news.p.rapidapi.com/v1/search?q=Elon%20Musk&lang=en",
    //   options: Options(
    //     headers: {
    //       "x-rapidapi-host": "free-news.p.rapidapi.com",
    //       "x-rapidapi-key": "b8dbf08bbamshfa839ce8398d8f7p13ed2fjsn80ee58a61a8d"
    //     },
    //   ),
    // );
    var response = await http.get(
      Uri.parse(
          "https://free-news.p.rapidapi.com/v1/search?q=Elon%20Musk&lang=en"),
      headers: {
        "x-rapidapi-host": "free-news.p.rapidapi.com",
        "x-rapidapi-key": "b8dbf08bbamshfa839ce8398d8f7p13ed2fjsn80ee58a61a8d"
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      print(body);
      return articles;
    } else {
      print(response.statusCode);
    }
  }
}
