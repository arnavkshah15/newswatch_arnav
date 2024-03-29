import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticlesByCategory(String category) async {
    final queryParameters = {
      'country': 'in',
      'source': 'bbc-news',
      'category': category,
      'apiKey': '01dbe9212cff4e8f988264a2b70d96bb'
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
