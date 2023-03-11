import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/components/customListTile.dart';
import 'package:newswatch_arnav/model/article_model.dart';
import 'package:newswatch_arnav/services/api_services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newswatch_arnav/screens/article_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.blue.shade400,
                ),
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                },
                // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Row(
            children: [
              Icon(Icons.location_on),
              Text("G.T Road, Kolkata",
                  style: TextStyle(color: Colors.black, fontSize: 12)),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 15,
              )
            ],
          ),
          actions: [
            Row(
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 70,
                        height: 40,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.stars_rounded, color: Colors.amber),
                            Text(
                              "599",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 15,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.lightBlue.shade400,
                  size: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 25,
                ),
              ],
            )
          ],
          backgroundColor: Colors.white),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                89, // add a fixed height constraint here
            child: FutureBuilder(
              future: client.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article> articles = snapshot.requireData;
                  return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
