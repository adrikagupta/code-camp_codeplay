import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foster/pages/homePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:foster/pages/home.dart';
import 'package:foster/pages/sleep.dart';
import 'package:foster/models/user_model.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   User userEntered; 
  
  createAccountInFirestore() async {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();
    userEntered = User(id: user.id, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
    if(!doc.exists){
      await User().addDocument(userEntered);
    }

  }
  
  login() async {
    await googleSignIn.signIn();
    print('signed In');
    await createAccountInFirestore();
    print(userEntered.id);
    print(userEntered.email);
    print("in auth");
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(currentUser: userEntered)));
  }


  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      if(account!=null){
        print('User Signed in $account');
        print(account.displayName);
      }  
    });
  }
    // googleSignIn.signInSilently(suppressErrors: false).then((account){
    //   if(account!=null){
    //     print('User Signed in $account');
    //     print(account.displayName);
    //   }
    // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Google Sign in'),
          onPressed: () => login()
          ),
      ),
    );
  }
}