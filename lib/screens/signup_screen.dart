import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  bool change = false;
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  int selected = 1;

  // movetoHome(BuildContext context) async {
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       change = true;
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //     await Navigator.pushNamed(context, MyRoutes.HomeRoute);

  //     setState(() {
  //       change = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                      TextFormField(
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Phone Number"),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
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
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("I am a")),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text("Media Reporter"),
                              value: 1,
                              groupValue: selected,
                              onChanged: (newvalue) {
                                setState(() {
                                  selected = newvalue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.blue,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text("Visitor"),
                              value: 2,
                              groupValue: selected,
                              onChanged: (newValue) {
                                setState(() {
                                  selected = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/verify');
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/gg.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("By signing up to News24 you are accepting our"),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
