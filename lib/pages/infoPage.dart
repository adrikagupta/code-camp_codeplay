import 'package:flutter/material.dart';
import 'package:foster/pages/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();


class InfoPage extends StatelessWidget {

  logout(BuildContext context) async {
    await googleSignIn.signOut();
    print('logged out');
    // Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
           child: RaisedButton.icon(
            icon: Icon(Icons.exit_to_app),
            onPressed: ()=> logout(context),
             label: Text('Logout'),
          )
    );
  }
}