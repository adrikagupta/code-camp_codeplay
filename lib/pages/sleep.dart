import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/models/sleep_model.dart';


class Sleep extends StatefulWidget {
  final String userId;
  Sleep({this.userId});
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  
  final sleepRef = Firestore.instance.collection("sleepList");
  DateTime now =  DateTime.now();
  bool clear=false;
  DateTime startDate =DateTime.now();
  DateTime endDate =DateTime.now();
  List<SleepModel> sleepSchedule =[]; 
  
  
  submit() async {
    await createSleepInFirestore(startDate ,endDate );
  }
  createSleepInFirestore(DateTime startDate, DateTime endDate) async {
    int duration = endDate.difference(startDate).inHours;
    await sleepRef.document(widget.userId).collection('sleep').add(
      {
        "day": sleepSchedule.length+1,
        "duration" : duration,
        "start": startDate,
        "end": endDate,
      }
    );
  }
  startDatePicker(BuildContext context){
    DatePicker.showDateTimePicker(
      context,
      currentTime: startDate,
      showTitleActions: true, 
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2025, 12, 31),
      onConfirm: (date) {
        setState(() {
        startDate = date;
        });
      },
      );
  }
  endDatePicker(BuildContext context){
    DatePicker.showDateTimePicker(
      context,
      currentTime: endDate,
      showTitleActions: true, 
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2025, 12, 31),
      onConfirm: (date) {
        setState(() {
        endDate = date;
        });
      },
      );
  }

  List<Widget> sleep(){
    return List.generate(sleepSchedule.length, (index){
    return Container(
              height: MediaQuery.of(context).size.height*0.95,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  gradient: new LinearGradient(
                    colors: [
                      Color.fromRGBO(7, 11, 52, 1.0), 
                      Color.fromRGBO(20, 24, 82, 1.0), 
                      Color.fromRGBO(43, 47, 119, 1.0),
                      Color.fromRGBO(72, 52, 117, 1.0),
                      Color.fromRGBO(107, 73, 132, 1.0),
                      Color.fromRGBO(133, 89, 136, 1.0),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                     SvgPicture.network(
                    'https://www.svgrepo.com/show/206383/moon.svg',
                    height: MediaQuery.of(context).size.height*0.2,
                  ),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
                Text(
                    'Day ${sleepSchedule[index].day}:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                                  'Sleep Duration : '+sleepSchedule[index].duration.toString() + ' hours',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.0,
                                    ),
                                ),
                    SizedBox(height: 20.0,),            
                   Text(
                    sleepSchedule[index].duration<8? 'Please Sleep well. Listen to lullabies' : 'Great Job! You\'re Sleeping pretty well',
                      style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                    ),
                    SizedBox(height: 20.0,),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Slept at:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                
                                ),
                                Text(
                                  sleepSchedule[index].start.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Text(
                                  sleepSchedule[index].start.toLocal().toString().split(' ')[1].split(':')[0] + ' : ' + sleepSchedule[index].start.toLocal().toString().split(' ')[1].split(':')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                ),
                                SizedBox(height: 20.0,),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Woke up at:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                
                                ),
                                Text(
                                  sleepSchedule[index].end.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Text(
                                  sleepSchedule[index].end.toLocal().toString().split(' ')[1].split(':')[0] + ' : ' + sleepSchedule[index].end.toLocal().toString().split(' ')[1].split(':')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                ),
                                SizedBox(height: 20.0,),
                              ],
                            ),
                          ],
                        ),
          ],
    ),
                ],
              ),
            );
    });
    }
  


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
                height: MediaQuery.of(context).size.height*0.95,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromRGBO(7, 11, 52, 1.0), 
                        Color.fromRGBO(20, 24, 82, 1.0), 
                        Color.fromRGBO(43, 47, 119, 1.0),
                        Color.fromRGBO(72, 52, 117, 1.0),
                        Color.fromRGBO(107, 73, 132, 1.0),
                        Color.fromRGBO(133, 89, 136, 1.0),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                       SvgPicture.network(
                      'https://www.svgrepo.com/show/206383/moon.svg',
                      height: MediaQuery.of(context).size.height*0.2,
                    ),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                  Text(
                      'Enter Sleep Schedule: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    startDate.toLocal().toString().split(' ')[0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                  ),
                                  Text(
                                    startDate.toLocal().toString().split(' ')[1].split(':')[0] + ' : ' + startDate.toLocal().toString().split(' ')[1].split(':')[1],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  RaisedButton(
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(20, 24, 82, 1.0), 
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                    side: BorderSide(color: Color.fromRGBO(133, 89, 136, 1.0))
                                  ),
                                  onPressed: () => startDatePicker(context),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                                    child: Text('Select Start date',
                                      style: TextStyle(
                                        fontSize: 14.0
                                      ),
                                    ),
                                  ),
                                ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    endDate.toLocal().toString().split(' ')[0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                  ),
                                  Text(
                                    endDate.toLocal().toString().split(' ')[1].split(':')[0] + ' : ' + endDate.toLocal().toString().split(' ')[1].split(':')[1],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  RaisedButton(
                                    textColor: Colors.white,
                                  color: Color.fromRGBO(20, 24, 82, 1.0), 
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                    side: BorderSide(color: Color.fromRGBO(133, 89, 136, 1.0))
                                  ),
                                    onPressed: () => endDatePicker(context),
                                    child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                                    child: Text('Select End date',
                                      style: TextStyle(
                                        fontSize: 14.0
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 45.0,),
                         RaisedButton(
                           textColor: Color.fromRGBO(20, 24, 82, 1.0),
                           color:  Colors.grey[300], 
                           shape: new RoundedRectangleBorder(
                             borderRadius: new BorderRadius.circular(30.0),
                             side: BorderSide(color:Color.fromRGBO(20, 24, 82, 1.0))
                           ),
                           onPressed: () async{
                          submit();
                          },
                          child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                                    child: Text('Submit',
                                      style: TextStyle(
                                        fontSize: 18.0
                                      ),
                                    ),
                                  ),
                        )
            ],
      ),
                  ],
                ),
              ),
          StreamBuilder<QuerySnapshot>(
          stream: sleepRef.document(widget.userId).collection('sleep').orderBy('day',descending: false).snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            sleepSchedule =  [];
            snapshot.data.documents.forEach((doc){
              sleepSchedule.add(SleepModel.fromDocument(doc));
            });
              print(sleepSchedule.length);
            return Column(
              children :
              sleep(),
            );
          },
        ),
        ],
      
    );
  }
}

