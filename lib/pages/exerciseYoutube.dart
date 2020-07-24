import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:foster/models/exercise_model.dart';

class ExerciseYoutubePlaylist extends StatefulWidget {
  final ExercisePlaylist exercisePlaylist;
  ExerciseYoutubePlaylist(this.exercisePlaylist);

  @override
  _ExerciseYoutubePlaylistState createState() => _ExerciseYoutubePlaylistState(this.exercisePlaylist);
}

class _ExerciseYoutubePlaylistState extends State<ExerciseYoutubePlaylist> {
  final ExercisePlaylist exercisePlaylist;
  _ExerciseYoutubePlaylistState(this.exercisePlaylist);
 static List <String> exerciseVideos;
  @override
  void initState() {
    exerciseVideos = exercisePlaylist.exerciseList.map((asana)=>YoutubePlayer.convertUrlToId(asana.videoUrl)).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<YoutubePlayerController> _controllers = 
      exerciseVideos.map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text("Tutorial",
        style: TextStyle(color: Colors.black,
         fontSize: 40 ),
        ),
        
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
           scrollDirection: Axis.vertical,
            itemBuilder: (context, int index){
              
                      return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              SizedBox(width: 10.0),
              ProgressBar(isExpanded: true),
              SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
            },
             itemCount: _controllers.length,
        separatorBuilder: (context, _) => SizedBox(height: 25.0),
            ),
        )
        ),
      
    );
  }
}
  
