//Todo: Order with time
//Todo: make time and date compulsory

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:foster/pages/taskList.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final tasksListRef = Firestore.instance.collection('tasksList');


class CreateTask extends StatefulWidget {
  final String currentUserId;
  CreateTask({this.currentUserId});
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController selectedDateController = TextEditingController();
  TextEditingController selectedTimeController = TextEditingController();
  TextEditingController taskNameController = TextEditingController();

  bool remindMe =true;
  String orderDate;
  String taskId = Uuid().v4();

  selectTime() async{
  final timePicked = await showRoundedTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
  ).then((value) => selectedTimeController.text = value.format(context));
    
  
  }

  selectDate() async{
  DateTime newDateTime = await showRoundedDatePicker(
  context: context,
  background: Colors.transparent,
  
  theme: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Color.fromRGBO(253, 114, 114,1.0),
    textTheme: TextTheme(
      caption: TextStyle(color: Colors.black54),
    ),
    
  ),
  
  initialDate: DateTime.now(),
  firstDate: DateTime(DateTime.now().year - 1),
  lastDate: DateTime(DateTime.now().year + 1),
  borderRadius: 16,
).then((value){
    selectedDateController.text = DateFormat.yMMMMd('en_US').format(value).toString();
    orderDate = DateFormat('yyyy-MM-dd').format(value).toString();
   });
  }

  addTask()async{
    Navigator.pop(context);
    await tasksListRef.document(widget.currentUserId).collection('tasks').document(taskId).setData({
      "taskName": taskNameController.text,
      "taskDate": selectedDateController.text,
      "taskTime": selectedTimeController.text,
      "remindMe": remindMe,
      "orderDate": orderDate,
      "completed": false,
      "taskId": taskId,
    });

      taskId= Uuid().v4();
  
    
    

  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 114, 114,1.0),
      body:SafeArea(
        child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Container(
                    
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom:10),
                      child: IconButton(
                        icon:Icon(Icons.arrow_back_ios, color: Colors.white,) , 
                        onPressed: ()=>Navigator.pop(context)
                        ),
                    ),
                      Row(
                        children: <Widget>[
                        Text("Create Task", style: TextStyle(
                       color: Colors.white,
                       fontSize: 40,
                       fontFamily: 'Merienda',
                       fontWeight: FontWeight.bold,
                     ),),
                      SizedBox(width: width*0.05,),
                      Container(
                        height: orientation==Orientation.portrait?70:0,
                        width: width*0.2,
                        decoration: BoxDecoration(
                          
                          image: DecorationImage(
                            image: AssetImage("assets/images/task2.png"),
                            fit: BoxFit.cover,
                          )
                        ),
                      )
                        ],
                      ),
                     
                     SizedBox(height: 30,),
                     Text("Name",style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontFamily: 'Merienda',
                       fontWeight: FontWeight.bold,
                     ),),
                     Container(
                     child:TextField(
                       controller:taskNameController ,
                       style: TextStyle(
                      color: Colors.white,
                       fontSize: 20,
                       fontFamily: 'Merienda',
                       fontWeight: FontWeight.w400,),
                       decoration: InputDecoration(
                        enabledBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                       ),
                       hintText: "Task Name"
                       ),
                       
                     ),
                     ),
                    ]
                    ),
                  ),
                   SizedBox(height: 30,),
                   Container(
                    //  height: height, //fix height
                     width: width,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                     ),
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal:15, vertical: 40),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                          Text("Date",style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontFamily: 'Merienda',
                          fontWeight: FontWeight.bold,
                         ),),
                        
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.calendar_today, size: 30, color:Colors.pink),
                                onPressed: (){
                                  selectDate();
                                },
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: width* 0.75,
                                child: TextField(
                                enabled:false,
                                controller: selectedDateController,
                                style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Merienda',
                                fontWeight: FontWeight.w400,),
                                decoration: InputDecoration(
                                  enabledBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                hintText: "Select date"
                                ),
                            ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text("Time",style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontFamily: 'Merienda',
                          fontWeight: FontWeight.bold,
                         ),),
                      
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.access_time, size: 30, color: Colors.pink,),
                                onPressed: (){
                                  selectTime();
                                },
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: width* 0.75,
                                child: TextField(
                                enabled: false,
                                controller: selectedTimeController,
                                style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Merienda',
                                fontWeight: FontWeight.w400,),
                                decoration: InputDecoration(
                                  enabledBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                hintText: "Select time"
                                ),
                            ),
                              ),
                            ],
                          ),

                          SizedBox(height: 40,),
                          Row(
                            children: <Widget>[
                              remindMe? 
                              Icon(Icons.notifications_none, size: 30, color: Colors.pink,):
                              Icon(Icons.notifications_off, size: 30, color: Colors.pink,),
                              SizedBox(width:20),
                              Text("Remind me", style: TextStyle(
                                color: Colors.black54,
                                fontSize:23,
                                fontFamily: 'Merienda',
                                fontWeight: FontWeight.w400,),),
                                Spacer(),
                                Switch(
                                onChanged: (value){
                                  setState(() {
                                    remindMe = value;

                                  });
                                },
                                value: remindMe,
                                activeColor: Colors.pink,
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: Container(
                              height:55,
                              width: width*0.5,
                              child: RaisedButton.icon(
                                color: Color.fromRGBO(253, 114, 114,1.0),
                                onPressed: ()=>addTask(),
                                icon: Icon(Icons.add_circle, size:25, color: Colors.white,),
                                label:Text("Add task", style:TextStyle(color: Colors.white, fontSize: 22))
                              ),
                            ),
                          ),
                          


                         ],
                       ),
                     ),
                   ),
                ],
              ),
            
        ),
      ),
    );
  }
}