import 'package:foster/models/exercise_model.dart';

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

final List<ExerciseList> big5 = [
    ExerciseList(
      title: 'Seated Row', 
      imageUrl: 'https://cdn2.vectorstock.com/i/1000x1000/86/96/seated-rowing-exercise-vector-25198696.jpg',
       description: "Rowing is an exercise where the purpose is to strengthen the muscles that draw the rower's arms toward the body as well as those that retract the scapulae and those that support the spine.",
       videoUrl: 'https://youtu.be/xQNrFHEMhI4',
     ),
    ExerciseList(
      title: 'Bench press', 
      imageUrl: 'https://workouttrends.com/wp-content/uploads/2013/10/Barbell-Bench-Press.gif',
       description: 'The bench press is an upper-body weight training exercise in which the trainee presses a weight upwards while lying on a weight training bench.', 
       videoUrl: 'https://youtu.be/0AEVLvFJLRI',
     ),
     ExerciseList(
      title: 'Pull Down', 
      imageUrl: 'https://www.fitprince.com/wp-content/uploads/2017/02/Front-vs-Rear-lat-pull-downs.jpg',
       description: '  It performs the functions of downward rotation and depression of the scapulae combined with adduction and extension of the shoulder joint.', 
       videoUrl: 'https://youtu.be/AOpi-p0cJkc',
     ),
     ExerciseList(
      title: 'Overhead Press', 
      imageUrl: 'https://www.oxygenmag.com/.image/t_share/MTY5NzQzMDU4NDgzNTUzNDQx/dumbbell-military-press-image.jpg',
       description: 'The press, overhead press or shoulder press is a weight training exercise with many variations, typically performed while standing, in which a weight is pressed straight upwards from racking position until the arms are locked out overhead, while the legs, lower back and abs maintain balance.', 
       videoUrl: 'https://www.youtube.com/watch?v=flpBXsHSVDk',
     ),
     ExerciseList(
      title: 'Leg Press', 
      imageUrl: 'https://johnsifferman.com/img/leg_press.jpg',
       description: 'The leg press is a weight training exercise in which the individual pushes a weight or resistance away from them using their legs.', 
       videoUrl: 'https://youtu.be/2sRzh9loTbM',
     ),
];

List<ExercisePlaylist> exercisePlaylist = [
    ExercisePlaylist(playlistname: 'Strength', exerciseList: strength, imageUrl: 'https://image.freepik.com/free-vector/fitness-people-doing-exercise_18591-36152.jpg'),
    ExercisePlaylist(playlistname: 'Aerobics', exerciseList: aerobics,   imageUrl: 'https://image.freepik.com/free-vector/sport-exercise-training-home-during-covid-19-coronavirus-outbreak_40345-764.jpg'),
    ExercisePlaylist(playlistname: 'THE “BIG 5”', exerciseList: big5 ,   imageUrl: 'https://image.freepik.com/free-vector/workout-concept-illustration_114360-1120.jpg'),
    
    ];
