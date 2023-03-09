import 'package:flutter/material.dart';
import 'package:newswatch_arnav/screens/login_screen.dart';
import 'package:newswatch_arnav/screens/reset_pass_screen.dart';
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
      },
    );
  }
}
