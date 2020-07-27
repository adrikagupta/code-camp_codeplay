// import 'package:foster/models/lullaby_model.dart';

// final lullabies = [
//   Music(title: 'Starry Sky', composed: 'Richard Maddux', image: '' , url:'https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/56992e2bb20943af6e227c8e/1452879638822/2starrysky25.mp3' ),
//   Music(title: 'Gentle Rain', composed: 'Richard Maddux' , image: '' , url:'https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/56992f2705f8e2e932cee9e5/1452879787703/3gentlerain13.mp3' ),
//   Music(title: 'Neptune', composed: 'Richard Maddux' , image:'' , url: 'https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/569934cf1a5203aa7d47cdca/1452881146274/11Neptune19.mp3'),
//   // Music(title: , composed: , image: , url: ),
// ];
import 'package:audio_service/audio_service.dart';

final lullabyQueue = <MediaItem>[
    MediaItem(
      id: "https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/56992e2bb20943af6e227c8e/1452879638822/2starrysky25.mp3",
      album: "Lullaby",
      title: "Starry Sky",
      artist: "Richard Maddux",
      duration: Duration(milliseconds: 358000),
      artUri:
          "https://image.freepik.com/free-vector/night-starry-sky-background_23-2148052388.jpg",
    ),
    MediaItem(
      id: "https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/56992f2705f8e2e932cee9e5/1452879787703/3gentlerain13.mp3",
      album: "Lullaby",
      title: "Gentle Rain",
      artist: "Richard Maddux",
      duration: Duration(milliseconds: 379000),
      artUri:
          "https://image.freepik.com/free-vector/night-sky-background-with-moon-blue-tones_23-2147614609.jpg",
    ),
    MediaItem(
      id: "https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/569934cf1a5203aa7d47cdca/1452881146274/11Neptune19.mp3",
      album: "Lullaby",
      title: "Neptune",
      artist: "Richard Maddux",
      duration: Duration(milliseconds: 210000 ),
      artUri:
          "https://image.freepik.com/free-photo/full-moon-with-starry-clouds-romantic-night_44527-740.jpg",
    ),
  ];
  