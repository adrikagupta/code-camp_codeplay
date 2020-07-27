import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      
      //   ],
      //   ),
      floatingActionButton:    
      // Align(
      //   alignment: Alignment.topRight,
      //         child: Container(
      //           width: 60.0,
      //           child: Padding(
      //               padding: EdgeInsets.only(top: 50.0),
      //               child: NeuButton(
      //                      child: Icon(Icons.music_note),
      //                      onPressed: (){},
      //                      decoration: NeumorphicDecoration(
      //                         shape: BoxShape.circle ,
      //                        color: Colors.white
      //                       )
      //                      ),
      //             ),
      //         ),
      // ),
      // Text('Lullabies',
      //             style: TextStyle(
      //                 // fontFamily: 'Lobster',
      //                 color: Colors.white,
      //              ),
      //             ),
      Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: Align(
          alignment: Alignment.topRight,
                child: GestureDetector(
                  child: Padding(
                    padding: const  EdgeInsets.only(top: 20.0, left: 20.0),
                    child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SvgPicture.network(
                            'https://www.svgrepo.com/show/243560/musical-note-music.svg',
                            height: height*0.08,
                          ),
                          SizedBox(
                            height: height*0.03,
                          ),
                          Text('Lullabies',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          ),
                        ],
                      ),
                    ),
                  onTap: (){
                    print('lullaby');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AudioServiceWidget(child: MainScreen());
                    }));
                  }
                  )
              //   RaisedButton.icon(
              //  color: Theme.of(context).primaryColor,
              //   icon: Icon(Icons.music_note,
              //       color: Colors.white,
              //    ),
              //   onPressed: (){},
              //    label: Text('Lullabies',
              //      style: TextStyle(
              //        color: Colors.white,
              //      )
              //    ),
              // ),
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
    );
  }
}
