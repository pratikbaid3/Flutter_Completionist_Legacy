import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import '../Utilities/external_db_helper.dart';
import '../Utilities/reusable_elements.dart';
import '../Utilities/checklist_helper.dart';
import '../Utilities/internal_db_helper.dart';

class TrophyPage extends StatefulWidget {
  TrophyPage({this.gameName, this.gameImageIcon});
  final gameName;
  final gameImageIcon;

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
  List<List<String>> trophyData;
  External_Database_Manager externalDbManager;
  Internal_Database_Manager internalDbManager;
  ChecklistManager checklistManager;

  bool isSwitched = false;
  int gameAdded = 0;
  int achievedTrophies = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    externalDbManager = new External_Database_Manager();
    internalDbManager = new Internal_Database_Manager();
    buildList();
  }

  void buildList() async {
    trophyData = await externalDbManager.getTrophyData(widget.gameName);
    checklistManager = new ChecklistManager(noOfElements: trophyData[0].length);
    checklistManager.buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
            child: NeuCard(
                curveType: CurveType.flat,
                bevel: 10,
                decoration: NeumorphicDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image(
                    image: NetworkImage(
                      widget.gameImageIcon,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: NeuSwitch<int>(
              thumbColor: accentColor,
              backgroundColor: backgroundColor,
              onValueChanged: (val) {
                setState(() {
                  if (gameAdded == 0) {
                    gameAdded = 1;
                    //addGameToFirestore();
                    internalDbManager.addGameToDb(
                        widget.gameName,
                        checklistManager.isSwitcher,
                        0,
                        checklistManager.isSwitcher.length);
                  } else {
                    gameAdded = 0;
                    internalDbManager.deleteDB();
                    //deleteGameFromFirestore();
                  }
                });
              },
              groupValue: gameAdded,
              children: {
                0: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                1: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: externalDbManager.getGameName(),
              builder: (context, snapshot) {
                Widget x;

                if (snapshot.hasData) {
                  x = ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      itemCount: trophyData[0].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return new Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 13.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: accentColor,
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
                                    image: NetworkImage(trophyData[3][index]),
                                  )),
                              title: Text(
                                '${trophyData[0][index]}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Switch(
                                value: checklistManager.isSwitcher[index],
                                onChanged: (value) {
                                  setState(() {
                                    checklistManager.isSwitcher[index] = value;
                                    if (value) {
                                      achievedTrophies++;
                                    } else {
                                      achievedTrophies--;
                                    }
                                    //updateGameFromFirebase();
                                    print(checklistManager.isSwitcher);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                              subtitle: Text(trophyData[1][index],
                                  style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}

/**void addGameToFirestore() async {
    FirebaseUser currentUser = await _auth.currentUser();
    String emailId = await currentUser.email;
    int noOfTrophies = checklistManager.isSwitcher.length;

    _firestore.collection('trophies').add({
    'emailId': emailId,
    'gameName': widget.gameName,
    'noOfTrophiesAchieved': 0,
    'totalNoOfTrophies': noOfTrophies,
    'trophiesAchieved': checklistManager.isSwitcher,
    });
    }

    void deleteGameFromFirestore() async {
    FirebaseUser currentUser = await _auth.currentUser();
    String emailId = await currentUser.email;
    _firestore
    .collection('trophies')
    .where('emailId', isEqualTo: emailId)
    .snapshots()
    .listen((event) {
    for (var snapshot in event.documents) {
    if (snapshot.data['gameName'] == widget.gameName) {
    snapshot.reference.delete();
    print('Deleted ${widget.gameName}');
    }
    }
    });
    }

    void updateGameFromFirebase() async {
    FirebaseUser currentUser = await _auth.currentUser();
    String emailId = currentUser.email;

    _firestore
    .collection('trophies')
    .where('emailId', isEqualTo: emailId)
    .snapshots()
    .listen((event) {
    for (var snapshot in event.documents) {
    snapshot.reference.updateData({
    'trophiesAchieved': checklistManager.isSwitcher,
    'noOfTrophiesAchieved': achievedTrophies,
    });
    }
    });
    }**/
