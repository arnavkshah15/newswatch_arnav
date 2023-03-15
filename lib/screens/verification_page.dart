import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
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
                        height: 100,
                      ),
                      Material(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/loc');
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
