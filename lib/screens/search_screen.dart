import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/components/customListTile.dart';
import 'package:newswatch_arnav/model/article_model.dart';
import 'package:newswatch_arnav/model/source_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> _articles = [];
  String _queries = '';
  String _defaultQuery = "sports"; // default query
  final client = http.Client();

  Future<List<Article>> _searchNews(String query) async {
    final String apiKey = '69e6e514545149d482118d36e07bed8c';
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';

    try {
      final response = await client.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> articlesJson = jsonData['articles'];

        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news articles');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  void initState() {
    super.initState();

    _searchNews(_defaultQuery).then((articles) {
      setState(() {
        _defaultQuery;
        _articles = articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search news...',
              border: InputBorder.none,
              icon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  String query = _searchController.text.trim();
                  if (query.isNotEmpty) {
                    setState(() {
                      _queries=query;
                    });
                    List<Article> articles = await _searchNews(query);
                    setState(() {
                      _articles = articles;
                    });
                  }
                },
              ),
            ),
          )),
      body: ListView(
        padding: EdgeInsets.all(35),
        children: [
            FutureBuilder(
              future: _searchNews(_queries),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article> articles = snapshot.data!;
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context));
                } else if (snapshot.hasError) {
                  return Text('Failed to load articles');
                }
                return Center(
                    child: SizedBox(
                        width: 48.0,
                        height: 48.0,
                        child: CircularProgressIndicator()));
              },
            ),
          if (_queries.isEmpty)
            Center(
              child: Text('No articles found'),
            ),
        ],
      ),
    );
  }
}
