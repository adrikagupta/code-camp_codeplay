import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/models/exercise_model.dart';
import 'package:foster/pages/exercise.dart';

class YogaExercise extends StatefulWidget {
  @override
  _YogaExerciseState createState() => _YogaExerciseState();
}

class _YogaExerciseState extends State<YogaExercise> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
           GestureDetector(
                    onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise(playlist: yogaPlaylist,))),
                    child: Stack(
                children: <Widget>[
                  
                  Container(
                  margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1),
                   width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.23,
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red[200], Colors.red[500]],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0,8),
                      blurRadius: 8,
                    ),
                    
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                    ),
                    // child: Text('HI')
                    ),
                  Positioned(
                    left: MediaQuery.of(context).size.width*0.2,
                    top: MediaQuery.of(context).size.height*0.06,
                    child: Text(
                      'Yoga',
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
                  ),
                  Positioned(
              left: MediaQuery.of(context).size.width*0.5,
               top: MediaQuery.of(context).size.height*0.0,
              child: SvgPicture.network(
                'https://image.flaticon.com/icons/svg/2647/2647625.svg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.23,
              ),
          )
                ],
              ),
            ),
             GestureDetector(
                    onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise(playlist: exercisePlaylist))),
                    child: Stack(
                children: <Widget>[
                  Container(
                  margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1),
                   width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.23,
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[200], Colors.green[500]],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0,8),
                      blurRadius: 8,
                    ),
                    
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                    ),
                    // child: Text('HI')
                    ),
                  Positioned(
                    left: MediaQuery.of(context).size.width*0.2,
                    top: MediaQuery.of(context).size.height*0.06,
                    child: Text(
                      'Workout',
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
                  ),
                  Positioned(
              left: MediaQuery.of(context).size.width*0.5,
               top: MediaQuery.of(context).size.height*0.0,
              child: SvgPicture.network(
                'https://image.flaticon.com/icons/svg/2548/2548537.svg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.23,
              ),
          )
                ],
              ),
            ),
        ],
      )
    );
  }
}