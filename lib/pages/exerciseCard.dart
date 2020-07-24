import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final ExercisePlaylist exercisePlaylist;
  final ExerciseList exerciseList;
  ExerciseCard({this.exerciseList, this.exercisePlaylist});
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
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0,8),
                  blurRadius: 8,
                ),
                
              ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              children: <Widget>[
                  // left: MediaQuery.of(context).size.width*0.05,
                  // top: MediaQuery.of(context).size.height*0.06,
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                      child: Text(
                      '${exerciseList.title}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        
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
                )
              ],
            ),
          ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width*0.1,
             top: MediaQuery.of(context).size.height*0.23,
            child: exerciseList.imageUrl.split('.').last == 'svg' ?SvgPicture.network(
              exerciseList.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width*0.35,
              height: MediaQuery.of(context).size.height*0.25,
            ):
            Image.network(
              exerciseList.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width*0.55,
              height: MediaQuery.of(context).size.height*0.25,
            )
            ,
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.50),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 15.0),
                    child:Text(
                          'Desciption:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.topCenter,
                    child:Text(
                          '${exerciseList.description}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                ),
                ],
            ),
          )
      ],),
    );
  }
}