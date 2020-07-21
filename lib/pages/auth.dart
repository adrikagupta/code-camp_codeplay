import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login(){
    googleSignIn.signIn();
  }

  @override
  void initState() {
    super.initState();
    googleSignIn.signInSilently(suppressErrors: false).then((account){
      if(account!=null){
        print('User Signed in $account');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: RaisedButton(
        child: Text('Google Sign in'),
        onPressed: () => login()
        ),
    );
  }
}