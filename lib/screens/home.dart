import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newswatch_arnav/widgets/customListTile.dart';
import 'package:newswatch_arnav/model/article_model.dart';
import 'package:newswatch_arnav/screens/Ads_page.dart';
import 'package:newswatch_arnav/screens/Poll_page.dart';
import 'package:newswatch_arnav/screens/addpost_screen.dart';
import 'package:newswatch_arnav/screens/login_screen.dart';
import 'package:newswatch_arnav/screens/settings_screen.dart';
import 'package:newswatch_arnav/services/api_services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newswatch_arnav/screens/article_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categor = [
    Tab(
      child: Text(
        'Popular',
        style: TextStyle(fontSize: 10),
      ),
    ),
    Tab(
      child: Text(
        'Business',
        style: TextStyle(fontSize: 10),
      ),
    ),
    Tab(
      child: Text(
        'Tech',
        style: TextStyle(fontSize: 10),
      ),
    ),
    Tab(
      child: Text(
        'Health',
        style: TextStyle(fontSize: 10),
      ),
    ),
    Tab(
      child: Text(
        'Science',
        style: TextStyle(fontSize: 10),
      ),
    ),
  ];
  final List<String> categories = [
    'general',
    'business',
    'technology',
    'health',
    'science'
  ];
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Ads'),
    Text('Add Post'),
    Text('Poll'),
    Text('Profile'),
  ];

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

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blue.shade400,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/search');
                  },
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
                      onTap: () {},
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
            bottom: TabBar(
              indicatorColor: Colors.lightBlue.shade400,
              indicatorWeight: 2.0,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: categor,
            ),
            backgroundColor: Colors.white),
        body: TabBarView(
          children: categories.map((category) {
            return FutureBuilder(
                future: client.getArticlesByCategory(category),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.hasData) {
                    List<Article> articles = snapshot.requireData;
                    return ListView.builder(
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
                });
          }).toList(),
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
      ),
    );
  }
}
