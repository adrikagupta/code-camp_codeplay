import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  logout(){
    googleSignIn.signOut();
    print('logged out');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.exit_to_app),
            onPressed: ()=> logout(),
             label: Text('Logout'),
          )
        ],
      ),
      // body: ,
    );
  }
}