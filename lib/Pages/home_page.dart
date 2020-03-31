import 'package:flutter/material.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/db_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utilities/util_class.dart';
import 'trophy_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<List<String>> items;
  List<String> filteredGames;
  List<String> filteredGamesIcon;
  final _debouncer = Debouncer(milliseconds: 500);

  Map gameDetail = new Map();

  bool initialized = false;
  Database_Manager dbManager;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getCurrentUser();
    dbManager = new Database_Manager();
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

  Future<void> convertListToMap() {
    int length = items[0].length;
    for (int i = 0; i < length; i++) {
      gameDetail[items[0][i]] = items[1][i];
    }
  }

  void buildList() async {
    items = await dbManager.getGameName();
    await convertListToMap();
    setState(() {
      filteredGames = items[0];
      filteredGamesIcon = items[1];
    });
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
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.8),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(38.0),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.6),
                                offset: const Offset(0, 2),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 4, bottom: 4),
                          child: TextField(
                            onChanged: (string) {
                              // TODO: check the change of the search bar here
                              _debouncer.run(() {
                                setState(() {
                                  filteredGames = items[0]
                                      .where((u) => (u
                                          .toLowerCase()
                                          .contains(string.toLowerCase())))
                                      .toList();
                                });
                              });
                            },
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Which game?',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(38.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.6),
                            offset: const Offset(0, 2),
                            blurRadius: 8.0),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            FontAwesomeIcons.search,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: dbManager.getGameName(),
                builder: (context, snapshot) {
                  Widget x;

                  if (snapshot.hasData) {
                    x = ListView.builder(
                        itemCount: filteredGames.length,
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
                              splashColor: Colors.white,
                              onTap: () {
                                //TODO: Go to the trophies page for the corresponding game
                                print(filteredGames[index]);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TrophyPage(
                                      gameName: filteredGames[index],
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffb383D4A),
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10)),
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
                                        image: NetworkImage(
                                            gameDetail[filteredGames[index]]),
                                      )),
                                  title: Text(
                                    '${filteredGames[index]}',
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
              ),
            ),
          ],
        ));
  }
}
