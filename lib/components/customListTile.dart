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
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
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
          SizedBox(height: 8.0),
          Text(
            article.title ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
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
                  article.source?.name ?? 'Unknown',
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
