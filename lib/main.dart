import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(OnBoarding());
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff202020),
          scaffoldBackgroundColor: Color(0xff202020),
          accentColor: Color(0xFF2063E9)),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /**Expanded(
              child: Container(
                child: FlareActor("assets/anim.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "idle"),
              ),
            ),**/
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: SizedBox(
                      height: 75,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Color(0xFFA6A6A6),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Color(0xFFA6A6A6),
                            indent: 20,
                            endIndent: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF2063E9),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
