import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import '../Utilities/db_helper.dart';
import '../Utilities/reusable_elements.dart';

class TrophyPage extends StatefulWidget {
  TrophyPage({this.gameName, this.gameImageIcon});
  final gameName;
  final gameImageIcon;

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
  List<List<String>> trophyData;
  Database_Manager dbManager;
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbManager = new Database_Manager();
    buildList();
  }

  void buildList() async {
    trophyData = await dbManager.getTrophyData(widget.gameName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.gameName,
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
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
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                print("Tapped");
              },
              child: NeuCard(
                curveType: CurveType.flat,
                bevel: 10,
                decoration: NeumorphicDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: backgroundColor,
                ),
                child: SizedBox(
                  child: Center(
                    child: Text(
                      "ADD GAME",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 50,
                  width: 150,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: dbManager.getGameName(),
              builder: (context, snapshot) {
                Widget x;

                if (snapshot.hasData) {
                  x = ListView.builder(
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
                          child: new InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              //TODO: Go to the trophies page for the corresponding game
                              print(trophyData[0][index]);
                            },
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
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                subtitle: Text(trophyData[1][index],
                                    style: TextStyle(color: Colors.white)),
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
          )
        ],
      ),
    );
  }
}
