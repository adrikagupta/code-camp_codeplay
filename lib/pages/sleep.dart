import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foster/models/sleep_model.dart';
import 'package:foster/pages/sleepSchedule.dart';

class Sleep extends StatefulWidget {
  final String userId;
  // final DateTime endDate;
  Sleep({this.userId});
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  
  final sleepRef = Firestore.instance.collection("sleepList");
  DateTime now =  DateTime.now();
  bool clear=false;
  // List isSubmit = [0,0];
  // List startDates =[];
  // List endDates =[];
  DateTime startDate =DateTime.now();
  DateTime endDate =DateTime.now();
  List<SleepModel> sleepSchedule =[]; 
  // List sleepDuration =[];
  @override
  void initState() {
    super.initState();
    // sleepSchedule.length=0;
    // startDates.add(now);
    // startDates.add(now);
    // endDates.add(now);
    // endDates.add(now);
    // print(startDates.length);
  }

  submit() async {
    setState((){
      // startDates.add(startDates[index].add(Duration(days: 1)));
      // endDates.add(endDates[index].add(Duration(days: 1)));
      // sleepDuration.add(startDates[index].difference(endDates[index]).inHours);
      // print(sleepDuration);
      // print('$index : $startDates ');
    });
    //TODO: create in firestore
    await createSleepInFirestore(startDate ,endDate );
    // setState(() {
      // isSubmit[index] = 1;
      // isSubmit.add(0);
    // });


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
      // int index= indx+1;
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
                      fontSize: 50.0,
                      //TODO: should add fonts
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                                  'Sleep Duration : '+sleepSchedule[index].duration.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      //TODO: should add fonts
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
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                
                                ),
                                Text(
                                  sleepSchedule[index].start.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                Text(
                                  sleepSchedule[index].start.toLocal().hour.toString() + ' : ' + sleepSchedule[index].start.toLocal().minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                SizedBox(height: 20.0,),
                              //   isSubmit[index]!=0?Text(''):RaisedButton(
                              //   textColor: Colors.white,
                              //   color: Color.fromRGBO(20, 24, 82, 1.0), 
                              //   shape: new RoundedRectangleBorder(
                              //     borderRadius: new BorderRadius.circular(30.0),
                              //     side: BorderSide(color: Color.fromRGBO(133, 89, 136, 1.0))
                              //   ),
                              //   onPressed: () => startDatePicker(context),
                              //   child: Text('Select Start date'),
                              // ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Woke up at:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                
                                ),
                                Text(
                                  sleepSchedule[index].end.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                Text(
                                  sleepSchedule[index].end.toLocal().hour.toString() + ' : ' + sleepSchedule[index].end.toLocal().minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                SizedBox(height: 20.0,),
                                // isSubmit[index]!=0?Text(''):RaisedButton(
                                //   textColor: Colors.white,
                                // color: Color.fromRGBO(20, 24, 82, 1.0), 
                                // shape: new RoundedRectangleBorder(
                                //   borderRadius: new BorderRadius.circular(30.0),
                                //   side: BorderSide(color: Color.fromRGBO(133, 89, 136, 1.0))
                                // ),
                                //   onPressed: () => endDatePicker(context),
                                //   child: Text('Select End date'),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        // Text(sleepSchedule[index].duration.toString())
                      //  isSubmit[index]!=0?Text(''):RaisedButton(
                      //    textColor: Color.fromRGBO(20, 24, 82, 1.0),
                      //    color:  Colors.white, 
                      //    shape: new RoundedRectangleBorder(
                      //      borderRadius: new BorderRadius.circular(30.0),
                      //      side: BorderSide(color:Color.fromRGBO(20, 24, 82, 1.0))
                      //    ),
                      //    onPressed: () async{
                      //   submit(index);
                      //   // await createSleepInFirestore();
                      //     },
                      //   child: Text('Submit'),
                      // )
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
        // Column(
        //   children: sleep(),
          
        //     ),
      
      Container(
              height: MediaQuery.of(context).size.height*0.95,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(
                //     'https://image.freepik.com/free-vector/mountains-landscape-background_23-2148267129.jpg',
                //     // 'https://image.freepik.com/free-vector/full-moon-night-ocean-cartoon-illustration_33099-2308.jpg',
                //     // scale: 1.0
                //     ),
                //     // fit: BoxFit.fitHeight,
                //   ),
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
                    'Enter: ',
                    // 'hi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      //TODO: should add fonts
                    ),
                  ),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  startDate.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                Text(
                                  startDate.toLocal().hour.toString() + ' : ' + startDate.toLocal().minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      //TODO: should add fonts
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
                                child: Text('Select Start date'),
                              ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  endDate.toLocal().toString().split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      //TODO: should add fonts
                                    ),
                                ),
                                Text(
                                  endDate.toLocal().hour.toString() + ' : ' + endDate.toLocal().minute.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      //TODO: should add fonts
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
                                  child: Text('Select End date'),
                                ),
                              ],
                            ),
                          ],
                        ),
                       RaisedButton(
                         textColor: Color.fromRGBO(20, 24, 82, 1.0),
                         color:  Colors.white, 
                         shape: new RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(30.0),
                           side: BorderSide(color:Color.fromRGBO(20, 24, 82, 1.0))
                         ),
                         onPressed: () async{
                        submit();
                        // await createSleepInFirestore();
                          },
                        child: Text('Submit'),
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
            //  [Text('hi')],
            sleep(),
          );
        },
      ),
      ],
    );
  }
}

