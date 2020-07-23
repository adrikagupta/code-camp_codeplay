
class ExercisePlaylist{
  String playlistname;
  List<ExerciseList> exerciseList;
  // String description;
  // Color start;
  // Color end;
  String imageUrl;
  ExercisePlaylist({
    this.playlistname, 
    this.exerciseList, 
    // this.start, 
    // this.end,
    // this.description, 
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

final List<ExerciseList> strength = [
    ExerciseList(title: 'Lunges', imageUrl: 'https://media3.giphy.com/media/l3q2Q3sUEkEyDvfPO/200.gif', description: 'A basic lunge works the muscles in your lower body, including your quadriceps, hamstrings, glutes, and calves.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U', ),
    ExerciseList(title: 'Squat to overhead raise', imageUrl: 'https://www.sparkpeople.com/assets/exercises/Dumbbell-Squat-with-Calf-Raise-and-Overhead-Press.gif', description: 'This exercise not only works your glutes and leg muscles, it also works the muscles in your core, back, and shoulders, as well as your triceps.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=7JtzNydMIJ8', ),
    ExerciseList(title: 'Planks', imageUrl: 'https://thumbs.gfycat.com/ShorttermPepperyDartfrog-small.gif', description: 'Planks are an excellent exercise for improving your core strength and stability. This exercise can also strengthen the muscles in your back, chest, and shoulders.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=pSHjTRCQxIw', ),
    ExerciseList(title: 'Pushups', imageUrl: 'https://thumbs.gfycat.com/GlossySkinnyDuckbillcat-small.gif', description: 'Standard pushups work the chest muscles (pectorals), as well as the shoulder muscles, triceps, and abdominals.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=rjc0O7OXS3g', ),
    ExerciseList(title: 'Resistance band pull apart', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/workouts/2016/12/bandpullapart-1480689234.gif', description: 'This exercise works the muscles in your back, shoulders, and arms.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=okRUV0bdXAU', ),
];
//TODO: should add youtube videos
final List<ExerciseList> aerobics = [
    ExerciseList(
      title: 'Running', 
      imageUrl: 'https://image.freepik.com/free-vector/couple-practicing-trail-run-training_74855-5474.jpg',
       description: 'Running is one of the most effective forms of aerobic exercise. It can improve heart health, burn fat and calories, and lift your mood, just to name a few.',
       videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
     ),
    ExerciseList(
      title: 'Swimming', 
      imageUrl: 'https://image.freepik.com/free-vector/boy-swimwear-is-swimming-pool-sea-sunny-day_10045-316.jpg',
       description: 'Swimming is a low-impact exercise, so it’s good for people prone to or recovering from an injury or living with limited mobility. It can help you tone your muscles and build strength and endurance.', 
       videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
     ),
     ExerciseList(
      title: 'Biking', 
      imageUrl: 'https://image.freepik.com/free-vector/girl-stationary-bike-concept-sport-active-lifestyle-isolated_174639-107.jpg',
       description: ' This low-impact exercise can help develop leg strength.', 
       videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
     ),
     ExerciseList(
      title: 'Jump rope', 
      imageUrl: 'https://image.freepik.com/free-vector/exercise-home-woman-jumping-rope-using-house-as-gym_24877-64916.jpg',
       description: 'Jumping rope helps develop better body awareness, hand-foot coordination, and agility.', 
       videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
     ),
     ExerciseList(
      title: 'Elliptical', 
      imageUrl: 'https://image.freepik.com/free-vector/woman-making-exercises_107173-10086.jpg',
       description: 'Elliptical machines provide a good cardiovascular workout that’s less stressful on the knees, hips, and back compared to the treadmill or running on the road or trails', 
       videoUrl: 'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
     ),
];

List<ExercisePlaylist> exercisePlaylist = [
    ExercisePlaylist(playlistname: 'Strength', exerciseList: strength, imageUrl: 'https://image.freepik.com/free-vector/fitness-people-doing-exercise_18591-36152.jpg'),
    ExercisePlaylist(playlistname: 'Aerobics', exerciseList: aerobics,   imageUrl: 'https://image.freepik.com/free-vector/sport-exercise-training-home-during-covid-19-coronavirus-outbreak_40345-764.jpg'),
    // ExercisePlaylist(playlistname: 'Flexibility', exerciseList: flexible, start: Color(0xFFC8E6C9) , end: Color(0xFF66BB6A),  imageUrl: 'https://image.flaticon.com/icons/svg/2548/2548521.svg'),
  ];