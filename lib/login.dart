import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociallogin_app/fblogin/fb_home.dart';
import 'package:sociallogin_app/provider/google_signin_provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double? _height;
  double? _width;

  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: _height,
            width: _width,
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  clipLogo(),
                  SizedBox(height: _height! / 22),
                  loginText(),
                  SizedBox(height: _height! / 25),
                  loginWithGoogleButton(),
                  SizedBox(height: _height! / 22),
                  loginWithFacebookButton(),
                  SizedBox(height: _height! / 22),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget clipLogo() {
    return Container(
      width: _width,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                color: Colors.redAccent[400],
                borderRadius: BorderRadius.circular(65)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70.0),
              child: Icon(
                Icons.app_registration,
                size: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginText() {
    return Container(
      width: _width! * 0.90,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login here",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Using your social media crendentials",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginWithFacebookButton() {
    return Container(
      height: 50,
      width: _width! * .90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue[900],
      ),
      child: MaterialButton(
        onPressed: () {
          FacebookAuth.instance
              .login(permissions: ["public_profile", "email"]).then((value) {
            FacebookAuth.instance.getUserData().then((userData) {
              setState(() {
                _userObj = userData;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FbHome(
                            userObj: _userObj,
                          )));
            });
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.facebook,
              size: 30,
              color: Colors.white,
            ),
            Text(
              "login with facebook",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }

  Widget loginWithGoogleButton() {
    return Container(
      height: 50,
      width: _width! * .90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogin();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/google_icon.png"),
            Text(
              "login with google",
              style: TextStyle(
                  color: Colors.redAccent[400],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }

  Widget loginWithInstaButton() {
    return Container(
      height: 50,
      width: _width! * .90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/google_icon.png"),
            Text(
              "login with instagram",
              style: TextStyle(
                  color: Colors.redAccent[400],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}


      
// keytool -exportcert -alias androiddebugkey -keystore "C:\Users\MANIII\.android\debug.keystore" | "C:\openssl-0.9.8k_X64\bin\openssl" sha1 -binary | "C:\openssl-0.9.8k_X64\bin\openssl" base64
      

