
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
    ExerciseList(title: 'Squat to overhead raise', imageUrl: 'https://www.sparkpeople.com/assets/exercises/Dumbbell-Squat-with-Calf-Raise-and-Overhead-Press.gif', description: 'This exercise not only works your glutes and leg muscles, it also works the muscles in your core, back, and shoulders, as well as your triceps.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=pn8mqlG0nkE', ),
    ExerciseList(title: 'Planks', imageUrl: 'https://thumbs.gfycat.com/ShorttermPepperyDartfrog-small.gif', description: 'Planks are an excellent exercise for improving your core strength and stability. This exercise can also strengthen the muscles in your back, chest, and shoulders.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=pSHjTRCQxIw', ),
    ExerciseList(title: 'Pushups', imageUrl: 'https://thumbs.gfycat.com/GlossySkinnyDuckbillcat-small.gif', description: 'Standard pushups work the chest muscles (pectorals), as well as the shoulder muscles, triceps, and abdominals.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=rjc0O7OXS3g', ),
    ExerciseList(title: 'Resistance band pull apart', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/workouts/2016/12/bandpullapart-1480689234.gif', description: 'This exercise works the muscles in your back, shoulders, and arms.', benifit: '', videoUrl: 'https://www.youtube.com/watch?v=okRUV0bdXAU', ),
];
final List<ExerciseList> aerobics = [
    ExerciseList(
      title: 'Running', 
      imageUrl: 'https://image.freepik.com/free-vector/couple-practicing-trail-run-training_74855-5474.jpg',
       description: 'Running is one of the most effective forms of aerobic exercise. It can improve heart health, burn fat and calories, and lift your mood, just to name a few.',
       videoUrl: 'https://www.youtube.com/watch?v=zdadjTgtgUU',
     ),
    ExerciseList(
      title: 'Swimming', 
      imageUrl: 'https://image.freepik.com/free-vector/boy-swimwear-is-swimming-pool-sea-sunny-day_10045-316.jpg',
       description: 'Swimming is a low-impact exercise, so it’s good for people prone to or recovering from an injury or living with limited mobility. It can help you tone your muscles and build strength and endurance.', 
       videoUrl: 'https://www.youtube.com/watch?v=pFN2n7CRqhw',
     ),
     ExerciseList(
      title: 'Biking', 
      imageUrl: 'https://image.freepik.com/free-vector/girl-stationary-bike-concept-sport-active-lifestyle-isolated_174639-107.jpg',
       description: ' This low-impact exercise can help develop leg strength.', 
       videoUrl: 'https://www.youtube.com/watch?v=hyXUOhqYLGM',
     ),
     ExerciseList(
      title: 'Jump rope', 
      imageUrl: 'https://image.freepik.com/free-vector/exercise-home-woman-jumping-rope-using-house-as-gym_24877-64916.jpg',
       description: 'Jumping rope helps develop better body awareness, hand-foot coordination, and agility.', 
       videoUrl: 'https://www.youtube.com/watch?v=0CeGsg-1NaA',
     ),
     ExerciseList(
      title: 'Elliptical', 
      imageUrl: 'https://image.freepik.com/free-vector/woman-making-exercises_107173-10086.jpg',
       description: 'Elliptical machines provide a good cardiovascular workout that’s less stressful on the knees, hips, and back compared to the treadmill or running on the road or trails', 
       videoUrl: 'https://www.youtube.com/watch?v=j38LNpTLwzY',
     ),
];

final List<ExerciseList> concentration = [
    ExerciseList(
      title: ' Padmasana', 
      imageUrl: 'https://image.flaticon.com/icons/svg/2647/2647577.svg',
       description: 'Padmasana or the lotus pose is a simple posture that reduces muscle tension and calms your mind. This pose makes you more mindful and improves brain functioning. It also relaxes your body.',
       videoUrl: 'https://youtu.be/odKi0b2K4LY',
     ),
    ExerciseList(
      title: 'Bhramari pranayama', 
      imageUrl: 'https://www.artofliving.org/sites/www.artofliving.org/files/wysiwyg_imageupload/Bhramari%20Pranayama%20%28Humming%20bee%20breathing%20technique%29%20for%20pregnancy_0.jpg',
       description: 'Bhramari pranayama is effective in instantly calming down the mind. It is one of the best breathing exercises to free the mind of agitation, frustration or anxiety and get rid of anger to a great extent.', 
       videoUrl: 'https://youtu.be/-9CfCIzUw-k',
     ),
     ExerciseList(
      title: 'Paschimottanasana', 
      imageUrl: 'https://www.artofliving.org/sites/www.artofliving.org/files/wysiwyg_imageupload/Paschimottasana%20-%20Seated%20forward%20bend%20pose_0.jpg',
       description: ' Stretches lower back, hamstrings and hips. Massages and tones the abdominal and pelvic organs. Tones the shoulders.', 
       videoUrl: 'https://youtu.be/T8sgVyF4Ux4',
     ),
     ExerciseList(
      title: 'Setu Bandha Sarvagasana', 
      videoUrl:'https://www.youtube.com/watch?v=g78vfuC4QBI',
       imageUrl: 'https://image.flaticon.com/icons/svg/2647/2647499.svg',
        description: 'This is a backbend and inversion that can be stimulating or restorative. '),
     ExerciseList(
      title: 'Padahastasana', 
      //should add image
      imageUrl: 'https://image.freepik.com/free-vector/woman-making-exercises_107173-10086.jpg',
       description: 'Padahastasana or the standing forward bend yoga pose energizes your nervous system. It also improves the blood flow to your brain, improving your memory and brain power', 
       videoUrl: 'https://youtu.be/B3eKTq-nCJo',
     ),
];


List<ExercisePlaylist> exercisePlaylist = [
    ExercisePlaylist(playlistname: 'Strength', exerciseList: strength, imageUrl: 'https://image.freepik.com/free-vector/fitness-people-doing-exercise_18591-36152.jpg'),
    ExercisePlaylist(playlistname: 'Aerobics', exerciseList: aerobics,   imageUrl: 'https://image.freepik.com/free-vector/sport-exercise-training-home-during-covid-19-coronavirus-outbreak_40345-764.jpg'),
    ExercisePlaylist(playlistname: 'Concentration', exerciseList: concentration, imageUrl: 'https://image.flaticon.com/icons/svg/2548/2548521.svg'),
  ];

  //should add image to concentration