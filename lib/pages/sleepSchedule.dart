import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/pages/lullaby.dart';
import 'package:foster/pages/musicNotification.dart';
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
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return SafeArea(
          child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 28.0, right: 0.0),
          child: Align(
            alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: orientation == Orientation.portrait? height*0.07 : height*0.15,
                        width: orientation == Orientation.portrait? height*0.07:height*0.15,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white.withOpacity(0.95),
                        // color: ,
                child:  SvgPicture.network(
                      'https://www.svgrepo.com/show/243560/musical-note-music.svg',
                      height: orientation == Orientation.portrait? height*0.03:height*0.06,
                ),
                                    onPressed: (){
                                print('lullaby');
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return AudioServiceWidget(child: MainScreen());
                                }));
                              }
              ),
                      ),
                      SizedBox(
                                      height: height*0.01,
                                    ),
                                    Text('Sleep Music',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    ),
                    ],
                  ),
          ),
        ),
        body:   
        SingleChildScrollView(
                child: Column(
            children: <Widget>[
              Sleep(userId: widget.userId)
            ]
          ),
        )
      ),
    );
  }
}
