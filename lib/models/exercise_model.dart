
class ExercisePlaylist{
  String playlistname;
  List<ExerciseList> exerciseList;
  String backgroundImage;
  String imageUrl;
  ExercisePlaylist({
    this.playlistname, 
    this.exerciseList, 
    this.backgroundImage, 
    this.imageUrl});
}


class ExerciseList{
  String title;
  String imageUrl;
  String videoUrl;
  String description;
  String benifit;
  String precaution;
  ExerciseList({
    this.title, 
    this.imageUrl, 
    this.videoUrl, 
    this.description, 
    this.benifit, 
    this.precaution
  });
}
