import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(OnBoarding());
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                child: FlareActor("assets/anim.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "idle"),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: SizedBox(
                      height: 90,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
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
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
