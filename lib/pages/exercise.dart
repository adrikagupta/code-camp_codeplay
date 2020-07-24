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
              child: Container(height: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(    image: DecorationImage(
            image: NetworkImage('https://image.freepik.com/free-photo/healthy-lifestyle-healthy-habits-detox-water-fruit-salad-sport-equipment-dumbbells-blue-background-top-view-copy-space_73529-469.jpg'),
            fit: BoxFit.cover
            // alignment: Alignment.bottomCenter
                        )
                      ),
            
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