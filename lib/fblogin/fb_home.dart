import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbHome extends StatefulWidget {
  final Map userObj;

  const FbHome({
    Key? key,
    required this.userObj,
  }) : super(key: key);

  @override
  _FbHomeState createState() => _FbHomeState();
}

class _FbHomeState extends State<FbHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.network(widget.userObj["picture"]["data"]["url"]),
              Text(widget.userObj["name"]),
              Text(widget.userObj["email"]),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () async {
                  await FacebookAuth.instance.logOut();
                },
                child: Text("logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
