import 'package:flutter/material.dart';
import 'package:foster/pages/sleep.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
