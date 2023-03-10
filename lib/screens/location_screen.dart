import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController searchController = TextEditingController();
  bool isButtonPressed = false;

  List<String> cities = [
    'Kolkata',
    'Delhi',
    'Bangalore',
    'Kochi',
    'Noida',
    'Mumbai',
    'Bangalore',
    'Kochi',
    'Noida',
    'Mumbai'
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search your city',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cities
                  .map(
                    (city) => Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            searchController.text = city;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/images/pointer.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 50,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                city,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
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
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
