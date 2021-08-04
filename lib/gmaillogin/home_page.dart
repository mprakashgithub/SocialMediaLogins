import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociallogin_app/gmaillogin/logged_in.dart';
import 'package:sociallogin_app/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return LoggedIn();
        } else if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text("Something went wrong"),
            ),
          );
        } else {
          return Login();
        }
      },
    ));
  }
}
