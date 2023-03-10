import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'source': 'bbc-news',
      'category': 'technology',
      'apiKey': '69e6e514545149d482118d36e07bed8c'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        await body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
