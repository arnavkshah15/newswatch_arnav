import 'package:flutter/material.dart';
import 'package:newswatch_arnav/screens/addpost_screen.dart';
import 'package:newswatch_arnav/screens/home.dart';
import 'package:newswatch_arnav/screens/login_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 4;
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
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPostPage()),
        );
        break;
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
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to profile page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('My Wallet'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to wallet page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.post_add),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('My Posts'),
            onTap: () {
              // TODO: Navigate to posts page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text('Boost Your Post'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to boost post page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to notification page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to terms and conditions page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to about page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Watch Ads & Earn'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to watch ads page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Refer and Earn'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to refer and earn page
            },
          ),
          SizedBox(height: 5),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Log out user
            },
          ),
        ],
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
