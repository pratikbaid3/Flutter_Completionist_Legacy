import 'package:flutter/material.dart';
import '../Utilities/db_helper.dart';

class TrophyPage extends StatefulWidget {
  TrophyPage({this.gameName});
  final gameName;

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
  List<List<String>> trophyData;
  Database_Manager dbManager;

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
                              horizontal: 10.0, vertical: 6.0),
                          child: new InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              //TODO: Go to the trophies page for the corresponding game
                              print(trophyData[0][index]);
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
                                      image: NetworkImage(trophyData[3][index]),
                                    )),
                                title: Text(
                                  '${trophyData[0][index]}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white, size: 30.0),
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
