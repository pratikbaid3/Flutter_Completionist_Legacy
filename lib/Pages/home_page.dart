import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/file_management.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
    buildList();
  }

  void getCurrentUser() async {
    try {
      FirebaseUser loggedInUser;
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void buildList() {
    items = List<String>.generate(10000, (i) => "ITEM $i");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: Text('${items[index]}'),
            );
          }),
    );
  }
}
