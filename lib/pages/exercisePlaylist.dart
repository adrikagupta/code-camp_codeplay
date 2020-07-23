import 'package:flutter/material.dart';
import 'package:foster/models/exercise_model.dart';
import 'package:foster/pages/exerciseCard.dart';
// import 'package:page_transition/page_transition.dart';

class ExercisePlaylistScreen extends StatelessWidget {

  final ExercisePlaylist exercisePlaylist;
  ExercisePlaylistScreen({this.exercisePlaylist});

  
  @override
  Widget build(BuildContext context) {
    List<ExerciseList> exerciseList= exercisePlaylist.exerciseList ;
    return Scaffold(
      body: SafeArea(
              child: Stack(
                children:<Widget>[
              Container(height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [exercisePlaylist.start, exercisePlaylist.end],
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft
              // ),

              ),
          child: PageView.builder(
            itemCount: exerciseList.length,
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              itemBuilder: (context, position){
            ExerciseList playlist = exerciseList.elementAt(position);
                return Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 100.0),
                  child: ExerciseCard(
                    exerciseList: playlist,
                    exercisePlaylist: exercisePlaylist ,
                    )
                );
              },
            ),
             ),
            //  Padding(
            //    padding: const EdgeInsets.only(bottom: 10.0),
              //  child: Align(
              //    alignment: Alignment.bottomCenter,
              //    child: Container(
              //      padding: EdgeInsets.only(bottom:8,right:6),
              //      height: 70,
              //      width:70,
              //      decoration: BoxDecoration(
              //        shape: BoxShape.circle,
              //        color: Colors.black54,
              //      ),
                //    child: Center(
                //      child: IconButton(
                //        icon: Icon(Icons.play_arrow, size: 40,color: Colors.white,),
                //        onPressed: ()=> Navigator.push(context, 
                //        PageTransition(type: PageTransitionType.fade, child: YogaYoutubePlaylist(yogaPlaylist))),
                //      )),
                //  ),
            //    ),
            //  ),
                ],
              ),
      ),
    );
  }
}