import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociallogin_app/provider/google_signin_provider.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        actions: [
          GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text("Logout"))
        ],
      ),
      body: Center(
        child: Column(
          children: [Text(user!.email!), Text(user!.displayName!)],
        ),
      ),
    );
  }
}
