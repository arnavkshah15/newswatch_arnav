import 'package:flutter/material.dart';
import 'package:newswatch_arnav/screens/home.dart';
import 'package:newswatch_arnav/screens/login_screen.dart';
import 'package:newswatch_arnav/screens/settings_screen.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController _headingController = TextEditingController();
  TextEditingController _tagController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _articleController = TextEditingController();
  int _selectedIndex = 2;
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
      // case 1:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => AddPostPage()),
      //   );
      //   break;
      // case 2:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => AddPostPage()),
      //   );
      //   break;
      // case 3:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => PollPage()),
      //   );
      //   break;
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
          onPressed: () {
            _selectedIndex = 0;
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: MediaQuery.of(context).size.height / 5,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Icon(Icons.add),
                            Text(
                              "Add Post Images",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _headingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Add Heading',
                  hintText: 'Enter heading...',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _tagController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Add Tag',
                  hintText: 'Enter tag...',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Category',
                  hintText: 'Enter category...',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Add Video Link',
                  hintText: 'Add video Links here',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _articleController,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 35, horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Write Articles',
                  hintText: 'Write article here...',
                ),
              ),
              SizedBox(height: 16.0),
              Material(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  // onTap: () => movetoHome(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Post",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    decoration: BoxDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
