import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/components/customListTile.dart';
import 'package:newswatch_arnav/model/article_model.dart';
import 'package:newswatch_arnav/screens/Ads_page.dart';
import 'package:newswatch_arnav/screens/Poll_page.dart';
import 'package:newswatch_arnav/screens/addpost_screen.dart';
import 'package:newswatch_arnav/screens/home.dart';
import 'package:newswatch_arnav/screens/settings_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> _articles = [];
  String _queries = 'general';
  final client = http.Client();

  Future<List<Article>> _searchNews(String query) async {
    final String apiKey = '01dbe9212cff4e8f988264a2b70d96bb';
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';

    try {
      final response = await client.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == "ok") {
          final List<dynamic> articlesJson = jsonData['articles'];
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        }
      }
      throw Exception('Failed to load news articles');
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Article> articles = await _searchNews(_queries);
    setState(() {
      _articles = articles;
    });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPostPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PollPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search news...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String query = _searchController.text.trim();
                if (query.isNotEmpty) {
                  setState(() {
                    _queries = query;
                  });
                  await _fetchData();
                }
              },
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 7,
              child: _articles.isEmpty
                  ? Center(child: Text('No articles found'))
                  : FutureBuilder(
                      future: _searchNews(_queries),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Article>> snapshot) {
                        if (snapshot.hasData) {
                          List<Article> articles = snapshot.data!;
                          if (articles.isEmpty) {
                            return Center(child: Text('No articles found'));
                          }
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) =>
                                customListTile(articles[index], context),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Failed to load articles');
                        }
                        return Center(
                          child: SizedBox(
                            width: 48.0,
                            height: 48.0,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome_motion_outlined),
                label: 'Ads',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.poll),
                label: 'Poll',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_sharp),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
