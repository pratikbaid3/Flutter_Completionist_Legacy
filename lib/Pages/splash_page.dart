import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utilities/external_db_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    External_Database_Manager manager = new External_Database_Manager();
    manager.Transfer_Data();
  }

  void getUser() async {
    try {
      Navigator.pushNamed(context, '/HomePage');
      /**FirebaseUser currentUser = await _auth.currentUser();
      if (currentUser != null) {
        Navigator.popAndPushNamed(context, '/HomePage');
      } else {
        Navigator.popAndPushNamed(context, '/OnBoardingPage');
      }**/
    } catch (e) {
      //print(e);
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
