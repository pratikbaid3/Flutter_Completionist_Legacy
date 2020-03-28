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
    setState(() {});
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
    );
  }
}
