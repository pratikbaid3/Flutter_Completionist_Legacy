import 'package:flutter/material.dart';
import '../Utilities/reusable_elements.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Widget _SignupBtn() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        onPressed: () async {
          print("SignUp Pressed");

          if (password == rePassword) {
            print("Password verification successful");
            print(email);
            print(password);
            print(gamerTag);
            try {
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);

              if (newUser != null) {
                Navigator.pushNamed(context, '/HomePage');
              }
            } catch (e) {
              print(e);
            }
          }
        },
        elevation: 6,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'SIGNUP',
          style: TextStyle(
              color: Color(0XFF527DAA),
              letterSpacing: 1.5,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _ReEnterPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              rePassword = value;
            },
            obscureText: true,
            cursorColor: Colors.white,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Re-Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _GamerTagTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gamer Tag',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              gamerTag = value;
            },
            keyboardType: TextInputType.text,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.face,
                color: Colors.white,
              ),
              hintText: 'Enter a Gamer ID ',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _EmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (value) {
              email = value;
            },
            cursorColor: Colors.white,
            validator: (value) =>
                value.isEmpty ? 'Email can\'t be empty' : null,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _PasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (value) {
              password = value;
            },
            cursorColor: Colors.white,
            validator: (value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  String email;
  String password;
  String gamerTag;
  String rePassword;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 70.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _GamerTagTF(),
                        SizedBox(
                          height: 20,
                        ),
                        _EmailTF(),
                        SizedBox(
                          height: 20,
                        ),
                        _PasswordTF(),
                        SizedBox(
                          height: 20,
                        ),
                        _ReEnterPassword(),
                        SizedBox(
                          height: 20,
                        )
                        //_buildForgotPasswordBtn(),
                      ],
                    ),
                    _SignupBtn(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
