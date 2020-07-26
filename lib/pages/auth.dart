import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:foster/models/user_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   User userEntered; 
   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  
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
   
    configurePushNotifications(user.uid);
    return user.uid;
    // final GoogleSignInAccount currentUser =  googleSignIn.currentUser;
    // assert(user.uid == currentUser.id);
    // print('signInWithGoogle succeeded: $currentUser');

  // createAccountInFirestore() async {
  //   final GoogleSignInAccount user = googleSignIn.currentUser;
  //   final DocumentSnapshot doc = await usersRef.document(user.id).get();
  //   userEntered = User(id: user.id, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
  //   if(!doc.exists){
  //     await User().addDocument(userEntered);
  //   }
    

  }
   configurePushNotifications(String id){
  
    
    if(Platform.isIOS){
      getIOSpermission();
    }

    _firebaseMessaging.getToken().then((token){
      print("FM Token: $token");
      usersRef.document(id).updateData({
        "androidNotificationToken":token
      });
    });
     
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("on message: $message\n");
    
        showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                        title: Text(message['notification']['body'], style: TextStyle(fontSize: 18,letterSpacing: 1.1, fontFamily: 'Merienda', color: Colors.black87),),
                        ),
                        actions: <Widget>[
                        FlatButton(
                            child: Text('OK',style: TextStyle(fontSize: 15, fontFamily: 'Merienda' ,color: Theme.of(context).primaryColor),),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
        );
        print("Notification  shown");
      },
       onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");

      showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                        // title: Text(message['data'][]),
                        title: Text(message['notification']['body'], style: TextStyle(fontSize: 18, fontFamily: 'Merienda', color: Colors.black87),),
                        ),
                        actions: <Widget>[
                        FlatButton(
                            child: Text('OK',style: TextStyle(fontSize: 15, fontFamily: 'Merienda' ,color: Theme.of(context).primaryColor),),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
        );
        print("Notification  shown");
      },
      onLaunch: (Map<String, dynamic> message) async {
      
        print("onResume: $message");

      showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                      
                        title: Text(message['notification']['body'], style: TextStyle(fontSize: 18, fontFamily: 'Merienda', color: Colors.black87),),
                        ),
                        actions: <Widget>[
                        FlatButton(
                            child: Text('OK',style: TextStyle(fontSize: 15, fontFamily: 'Merienda' ,color: Theme.of(context).primaryColor),),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
        );
        print("Notification  shown");
      
      },
    
    );
  }
 
  getIOSpermission(){
    _firebaseMessaging.requestNotificationPermissions((
      IosNotificationSettings(alert:true,badge:true,sound:true)
    ));
    _firebaseMessaging.onIosSettingsRegistered.listen((event) {print("Setting registered:$event");});
  }
  
  // login() async {
  //   await googleSignIn.signIn();
  //   print('signed In');
  //   await createAccountInFirestore();
  //   print(userEntered.id);
  //   print(userEntered.email);
  //   print("in auth");
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(currentUser: userEntered)));
  // }


  @override
  void initState() {
    super.initState();
//     googleSignIn.onCurrentUserChanged.listen((account) {
//       if(account!=null){
//         print('User Signed in $account');
//         print(account.displayName);
//       }  
//     });
//   }
    // googleSignIn.signInSilently(suppressErrors: false).then((account){
    //   if(account!=null){
    //     print('User Signed in $account');
    //     print(account.displayName);
    //         //  Navigator.push(context, MaterialPageRoute(builder: (context) => SleepSchedule(account.id)));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
          style: TextStyle(
              // fontWeight: FontWeight.w600,
              fontSize: 22.0,
              // color: Colors.lightGreen[200],
          ),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(253, 114, 114,0.5) ,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*0.9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:[
              Colors.pink[100],
              Colors.yellow[100],
              Colors.yellow[200],
              Colors.pink[100]
            ],
             ),
          image: DecorationImage(
            image: NetworkImage('https://image.freepik.com/free-vector/colorful-background-watercolor-design_23-2148481367.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        child: GestureDetector(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
              color: Color.fromRGBO(253, 114, 114,0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0)
              )
            ),),
                 Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     SvgPicture.asset(
                      'assets/images/icons8-gmail.svg',
                      height: MediaQuery.of(context).size.height*0.15,
                ),
                Text('Google Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                    color: Colors.lightGreen[200],
                  ),
                ),
                   ],
                 ),
                  
              ],
            ),
          ),
          onTap: () async {
                    String id = await signInWithGoogle();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userId: id)));
                    },
        ),
      ),
    );
  }
}
