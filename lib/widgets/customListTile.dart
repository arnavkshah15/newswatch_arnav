import 'package:flutter/material.dart';
import 'package:newswatch_arnav/model/article_model.dart';
import 'package:newswatch_arnav/screens/article_detail.dart';
import 'package:share_plus/share_plus.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.urlToImage != null
              ? Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover,
                      )),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/load.jpg',
                    image: article.urlToImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.0,
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/load.jpg',
                          fit: BoxFit.cover);
                    },
                  ),
                )
              : Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/news.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              article.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  article.author ?? 'Unknown',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
              Icon(
                Icons.verified,
                color: Colors.blue,
                size: 10,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              article.description ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.lightBlue.shade400,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Colors.lightBlue.shade400,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.lightBlue.shade400,
                ),
                onPressed: () async {
                  await Share.share('${article.title}\n\n${article.url}');
                },
              ),
              Text(
                "Sponsored Post",
                style: TextStyle(fontSize: 7, color: Colors.orange),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Text(
                "95 Comments",
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 50,
              ),
              Text(
                "4.5k Views",
                style: TextStyle(fontSize: 10, color: Colors.black),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
