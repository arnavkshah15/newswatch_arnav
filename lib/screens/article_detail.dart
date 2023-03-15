import 'package:flutter/material.dart';
import 'package:newswatch_arnav/model/article_model.dart';

import 'package:share_plus/share_plus.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.ios_share_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null
                ? Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(article.urlToImage ??
                              'https://via.placeholder.com/150'),
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://source.unsplash.com/weekly?coding'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  article.title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text("By "),
                  Container(
                    child: Text(
                      article.author ?? 'Unknown',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.comment,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                Text("8 comments"),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                Text("34 Likes"),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    await Share.share('${article.title}\n\n${article.url}');
                  },
                ),
                Text("Share")
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  article.description ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
