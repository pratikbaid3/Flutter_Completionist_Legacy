import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/db_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Database_Manager manager = new Database_Manager();
    manager.Transfer_Data();
  }

  void getUser() async {
    try {
      FirebaseUser currentUser = await _auth.currentUser();
      if (currentUser != null) {
        Navigator.pushNamed(context, '/HomePage');
      } else {
        Navigator.pushNamed(context, '/OnBoardingPage');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 4), () {
      getUser();
    });

    return Scaffold(
      body: Center(
        child: FlareActor("assets/anim.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "idle"),
      ),
    );
  }
}
