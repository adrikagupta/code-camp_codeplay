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
      duration: Duration(milliseconds: 5739820),
      artUri:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
    MediaItem(
      id: "https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/56992f2705f8e2e932cee9e5/1452879787703/3gentlerain13.mp3",
      album: "Lullaby",
      title: "Gentle Rain",
      artist: "Richard Maddux",
      duration: Duration(milliseconds: 2856950),
      artUri:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
    MediaItem(
      id: "https://static1.squarespace.com/static/561fe6c6e4b0b8c55edc9146/5699229505caa7a89cf149ad/569934cf1a5203aa7d47cdca/1452881146274/11Neptune19.mp3",
      album: "Lullaby",
      title: "Neptune",
      artist: "Richard Maddux",
      duration: Duration(milliseconds: 2856950),
      artUri:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
  ];
  