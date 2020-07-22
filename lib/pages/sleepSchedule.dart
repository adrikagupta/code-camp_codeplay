import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foster/pages/sleep.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class SleepSchedule extends StatefulWidget {
  final String userId;
  SleepSchedule({this.userId});
  @override
  _SleepScheduleState createState() => _SleepScheduleState();
}

class _SleepScheduleState extends State<SleepSchedule> {

    logout(){
    googleSignIn.signOut();
    print('logged out');
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //    appBar: AppBar(
    //     title: Text('Sleep Schedule'),
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     actions: <Widget>[
    //       RaisedButton.icon(
    //         icon: Icon(Icons.exit_to_app),
    //         onPressed: ()=> logout(),
    //          label: Text('Logout'),
    //       )
    //     ],
        
    //   ),
      body:  
      SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Sleep(userId: widget.userId)
          ]
        ),
      )
    );
  }
}