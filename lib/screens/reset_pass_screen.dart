import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String name = "";
  bool change = false;
  
  bool _obscureText = true;
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/images/logo.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter your Email"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Verification Code"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter New Password"),
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              labelText: "Re Enter your Password")),
                      SizedBox(
                        height: 100,
                      ),
                      Material(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
