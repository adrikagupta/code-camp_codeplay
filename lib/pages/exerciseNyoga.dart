import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/models/exerciseList.dart';
import 'package:foster/models/yogaList.dart';
import 'package:foster/pages/exercise.dart';

class YogaExercise extends StatefulWidget {
  @override
  _YogaExerciseState createState() => _YogaExerciseState();
}

class _YogaExerciseState extends State<YogaExercise> {
  @override
  Widget build(BuildContext context) {
    
    var height;
    var width;
    var orientation = MediaQuery.of(context).orientation;
    height = orientation==Orientation.landscape? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    width = orientation==Orientation.portrait? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
            height:height*0.9,
              // height: 100.0,
              decoration: BoxDecoration(    image: DecorationImage(
            image: AssetImage('assets/images/breathe.jpg'),
            fit: BoxFit.cover
                   )
                      ),

        child:orientation==Orientation.landscape? Row :Column
        (
          
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
             GestureDetector(
                      onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise(playlist: yogaPlaylist,background: 'assets/images/mandala-4.jpg', asset: 1,))),
                      child: Stack(
                  children: <Widget>[
                    
                    Container(
                    margin: EdgeInsets.symmetric(horizontal:width*0.1),
                     width: width*0.8,
                      height: height*0.23,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 134, 133,1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0,8),
                        blurRadius: 8,
                      ),
                      
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                      ),
                      ),
                    Positioned(
                      left:width*0.2,
                      top:height*0.06,
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
                left: width*0.5,
                 top: height*0.0,
                child: SvgPicture.network(
                  'https://image.flaticon.com/icons/svg/2647/2647625.svg',
                  fit: BoxFit.cover,
                  width: width*0.45,
                  height: height*0.23,
                ),
            )
                  ],
                ),
              ),
               GestureDetector(
                      onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercise(playlist: exercisePlaylist, background: 'https://image.freepik.com/free-photo/healthy-lifestyle-healthy-habits-detox-water-fruit-salad-sport-equipment-dumbbells-blue-background-top-view-copy-space_73529-469.jpg', asset: 0,))),
                      child: Stack(
                  children: <Widget>[
                    Container(
                    margin: EdgeInsets.symmetric(horizontal:width*0.1),
                     width: width*0.8,
                      height: height*0.23,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 194, 145,1.0),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0,8),
                        blurRadius: 8,
                      ),
                      
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                      ),
                      ),
                    Positioned(
                      left:  width*0.2,
                      top:  height*0.06,
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
                left: width*0.55,
                 top: height*0.0,
                child: SvgPicture.network(
                  'https://image.flaticon.com/icons/svg/2548/2548537.svg',
                  fit: BoxFit.cover,
                  width:  width*0.4,
                  height:  height*0.23,
                ),
            )
                  ],
                ),
              ),
          ],
        ),
      )
    );
  }
}