import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<List<String>> items;
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
    items = await dbManager.getGameName();
    print(items[1]);
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
        body: FutureBuilder(
          future: dbManager.getGameName(),
          builder: (context, snapshot) {
            Widget x;

            if (snapshot.hasData) {
              x = ListView.builder(
                  itemCount: items[0].length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(items[1][index]),
                      ),
                      title: Text('${items[0][index]}'),
                    );
                  });
            } else if (snapshot.hasError) {
              x = Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              );
            } else {
              x = Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
              );
            }
            return x;
          },
        ));
  }
}
