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
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return new Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: new InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          print(items[0][index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffb383D4A),
                            borderRadius:
                                new BorderRadius.all(const Radius.circular(10)),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.white24))),
                                child: Image(
                                  width: 90,
                                  height: 90,
                                  image: NetworkImage(items[1][index]),
                                )),
                            title: Text(
                              '${items[0][index]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30.0),
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.linear_scale,
                                    color: Colors.yellowAccent),
                                Text(" Intermediate",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
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
