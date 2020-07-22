import 'package:cloud_firestore/cloud_firestore.dart';

class SleepModel{
  final int day;
  final int duration;
  final DateTime start;
  final DateTime end;

  SleepModel({this.day, this.duration, this.start, this.end});
  
 factory SleepModel.fromDocument(DocumentSnapshot doc){
    return SleepModel(
      day: doc['day'],
      duration: doc['duration'],
      start: doc['start'].toDate(),
      end: doc['end'].toDate(),
    );
  }

}