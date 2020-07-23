import 'package:flutter/material.dart';
import 'package:foster/models/exercise_model.dart';
import 'package:foster/pages/exercisePlaylist.dart';
import 'package:foster/pages/exercisePlaylistCard.dart';

class Exercise extends StatefulWidget {
  @override
  _ExerciseState createState() => _ExerciseState();

}
class _ExerciseState extends State<Exercise> {
    
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
              child: Container(height: 600.0,
          child: PageView.builder(
            itemCount: exercisePlaylist.length,
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              itemBuilder: (context, position){
            ExercisePlaylist playlist = exercisePlaylist.elementAt(position);
                return Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisePlaylistScreen(
                        exercisePlaylist: playlist,
                      )
                      )
                      ),
                      child: ExercisePlaylistCard(
                      exercisePlaylist: playlist,
                      cardNum: position,
                    ),
                  )
                );
              },
              
            ),
        ),
      )
        );
  }
}