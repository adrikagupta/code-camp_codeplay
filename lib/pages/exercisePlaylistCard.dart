import 'package:flutter/material.dart';
import 'package:foster/models/exercise_model.dart';

class ExercisePlaylistCard extends StatelessWidget {
  final ExercisePlaylist exercisePlaylist;
  final int cardNum;
  ExercisePlaylistCard({this.exercisePlaylist, this.cardNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width*0.2,
      // height: MediaQuery.of(context).size.height*0.3,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align( 
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.6,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Align(
              alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                '${exercisePlaylist.playlistname}',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromRGBO(43, 203, 186, 1.0),
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(0,2),
                        blurRadius: 2,
                      )
                    ]
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
                  ),
            ),
          ),
          ), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // child: ClipRRect(
                    // borderRadius: BorderRadius.circular(30.0),
                     child:
                      Image.network(
                      //  height: ,
                    exercisePlaylist.imageUrl,
                    fit: BoxFit.fitWidth,
                    // width: MediaQuery.of(context).size.width*0.2,
                    // height: MediaQuery.of(context).size.height*0.3,
            
                ),
              // ),
            ),
      ],),
    );
  }
}