import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Pod'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/GamePage');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              padding: EdgeInsets.only(left: 20, top: 5),
            ),
            Padding(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              padding: EdgeInsets.only(top: 5, right: 20),
            ),
          ],
        ),
      ),
    );
  }
}
