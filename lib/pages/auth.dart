import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foster/pages/sleepSchedule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:foster/pages/home.dart';
import 'package:foster/pages/sleep.dart';
import 'package:foster/models/user_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  // createAccountInFirestore() async {
  //   final GoogleSignInAccount user = googleSignIn.currentUser;
  //   final DocumentSnapshot doc = await usersRef.document(user.id).get();
  //   User userEntered = User(id: user.id, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
  //   if(!doc.exists){
  //     await User().addDocument(userEntered);
  //   }

  // }
  
  // login() async {
  //   await googleSignIn.signIn();
  //   print('signed In');
  //   await createAccountInFirestore();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SleepSchedule()));
  // }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    print("Sign in Passed");
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    final CollectionReference userRef = Firestore.instance.collection('users');
    User userEntered = User(id: user.uid, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
    final DocumentSnapshot doc= await userRef.document(user.uid).get();
    if(!doc.exists){
      await User().addDocument(userEntered);
    }
    return user.uid;
    // final GoogleSignInAccount currentUser =  googleSignIn.currentUser;
    // assert(user.uid == currentUser.id);
    // print('signInWithGoogle succeeded: $currentUser');
  }

  @override
  void initState() {
    super.initState();
    // googleSignIn.onCurrentUserChanged.listen((account) {
    //   if(account!=null){
    //     print('User Signed in $account');
    //     print(account.displayName);
    //   }  
    // });
    googleSignIn.signInSilently(suppressErrors: false).then((account){
      if(account!=null){
        print('User Signed in $account');
        print(account.displayName);
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => SleepSchedule(account.id)));
      }
    });
  }

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
          onPressed: () async {
            String id = await signInWithGoogle();
            Navigator.push(context, MaterialPageRoute(builder: (context) => SleepSchedule(userId: id)));
            }
          ),
      ),
    );
  }
}