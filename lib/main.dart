import 'package:flutter/material.dart';
import 'package:newswatch_arnav/screens/Ads_page.dart';
import 'package:newswatch_arnav/screens/Poll_page.dart';
import 'package:newswatch_arnav/screens/addpost_screen.dart';
import 'package:newswatch_arnav/screens/home.dart';
import 'package:newswatch_arnav/screens/location_screen.dart';
import 'package:newswatch_arnav/screens/login_screen.dart';
import 'package:newswatch_arnav/screens/profile_page.dart';
import 'package:newswatch_arnav/screens/reset_pass_screen.dart';
import 'package:newswatch_arnav/screens/search_screen.dart';
import 'package:newswatch_arnav/screens/settings_screen.dart';
import 'package:newswatch_arnav/screens/signup_screen.dart';
import 'package:newswatch_arnav/screens/splash_screen.dart';
import 'package:newswatch_arnav/screens/verification_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/resetp': (context) => ResetPage(),
        '/verify': (context) => VerifyPage(),
        '/loc': (context) => LocationPage(title: 'City Search'),
        '/home': (context) => HomePage(),
        '/post': (context) => AddPostPage(),
        '/setting': (context) => SettingsPage(),
        '/ads': (context) => AdsPage(),
        '/poll': (context) => PollPage(),
        '/search': (context) => SearchPage(),
        '/profile':(context) => ProfilePage(),
      },
    );
  }
}
