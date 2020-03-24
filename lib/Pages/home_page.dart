import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> items;
  bool initialized = false;
  Database_Manager dbManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
    dbManager = new Database_Manager();
    dbManager.Transfer_Data();
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

  void buildList() async {
    items = List<String>.generate(10000, (i) => "Item $i");
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
