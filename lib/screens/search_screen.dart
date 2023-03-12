import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> _articles = [];

  Future<void> _searchNews(String query) async {
    final String apiKey = '69e6e514545149d482118d36e07bed8c';
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> articlesJson = jsonData['articles'];

        setState(() {
          _articles =
              articlesJson.map((json) => Article.fromJson(json)).toList();
        });
      } else {
        throw Exception('Failed to load news articles');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search news',
              ),
              onSubmitted: (value) {
                _searchNews(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_articles[index].title),
                  subtitle: Text(_articles[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Article {
  final String title;
  final String description;

  Article({
    required this.title,
    required this.description,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
