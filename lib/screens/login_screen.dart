import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool change = false;
  
  bool _obscureText = true;

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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/resetp');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, '/home'),
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
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width / 3.5,
                              color: Colors.black,
                            ),
                            Text("  or sign in with  "),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width / 3.5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      Image.asset("assets/images/gg.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have an account? ",
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/signup');
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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
