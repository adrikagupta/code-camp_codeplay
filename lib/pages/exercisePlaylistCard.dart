import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foster/models/exercise_model.dart';

class ExercisePlaylistCard extends StatelessWidget {
  final ExercisePlaylist exercisePlaylist;
  final int cardNum;
  ExercisePlaylistCard({this.exercisePlaylist, this.cardNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align( 
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.7,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black12,
              //     offset: Offset(0,8),
              //     blurRadius: 8,
              //   ),
                
              // ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: MediaQuery.of(context).size.width*0.1,
                  top: MediaQuery.of(context).size.height*0.06,
                  child: Text(
                    '${exercisePlaylist.playlistname}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(0,2),
                          blurRadius: 2,
                        )
                      ]
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                )
              ],
            ),
          ),
          ),
          // Positioned(
          //   left: MediaQuery.of(context).size.width*0.12,
          //    top: MediaQuery.of(context).size.height*0.35,
            // child: SvgPicture.network(
            //   yogaPlaylist.imageUrl,
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width*0.3,
            //   height: MediaQuery.of(context).size.height*0.25,
            // ),
            // child: 
            Image.network(
                exercisePlaylist.imageUrl,
              // fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width*0.3,
              // height: MediaQuery.of(context).size.height*0.25,
            
            ),
          // )
      ],),
    );
  }
}