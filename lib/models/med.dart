import 'package:cloud_firestore/cloud_firestore.dart';

class Med{
  final String medId;
  final String medStartDate;
  final String medName;
  final int medDosage;
  final int medDuration;
  final int medInterval;
  final bool medTaken;
  final List medTimePeriods;

  Med({this.medId,this.medDuration,this.medStartDate,this.medInterval,this.medDosage,this.medName,this.medTaken,this.medTimePeriods});

  factory Med.fromDocument(DocumentSnapshot doc){
    return Med(
      medId: doc['medId'],
      medDosage: doc['medDosage'],
      medDuration: doc['medDuration'],
      medInterval: doc['medInterval'],
      medName: doc['medName'],
      medTimePeriods: doc['medTimePeriods'],
      medStartDate: doc['medStartDate'],
      medTaken: doc['medTaken']
    );

  }
  
}