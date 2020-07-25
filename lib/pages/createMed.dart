import 'package:button_picker/button_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:foster/widgets/timePeriod.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:uuid/uuid.dart';

//dosage and time periods should be equal

final medsListRef = Firestore.instance.collection('medsList');


class CreateMed extends StatefulWidget {
  final String currentUserId;
  CreateMed({this.currentUserId});
  @override
  _CreateMedState createState() => _CreateMedState();
}

class _CreateMedState extends State<CreateMed> {
  TextEditingController medNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  DateTime timePeriod;
  String time;
  List<String> times = [];
  String medId = Uuid().v4();
  var medDosage;
  String medStartDate;
  var medInterval;
  var medDuration;
  bool medTaken = false;

 submit()async{
   if(medDosage == times.length && medInterval!=0 && medDuration!=0 && medStartDate!=null && medNameController.text.isNotEmpty){
   Navigator.pop(context);
   times.sort();
  

    await medsListRef.document(widget.currentUserId).collection('meds').document(medId).setData({
      "medId":medId,
      "medName":medNameController.text,
      "medDosage": medDosage,
      "medTimePeriods": times,
      "medStartDate":medStartDate,
      "medInterval":medInterval,
      "medDuration":medDuration,
      "medTaken":medTaken

    });
    medId = Uuid().v4();
  }
  else{
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Check if Dosage and number of Time Periods are same. Also check if you have entered all the fields.",style: TextStyle(fontSize: 15),),
        actions: <Widget>[
           FlatButton(  
                child:Text('OK',style: TextStyle(color: Colors.red[300],fontSize: 15),),  
                onPressed: () =>Navigator.of(context).pop()
           )
        ]
  
      )
      );
  }
 }




  timePicker (BuildContext context){
    return showDialog(
      context: context,
      builder: (context){

    return AlertDialog(
      title:Text("Choose Time", textAlign: TextAlign.center) ,
      content: TimePickerSpinner(
    is24HourMode: true,
    normalTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black87
    ),
    highlightedTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.red[300]
    ),
    spacing: 50,
    itemHeight: 40,
    isForce2Digits: true,
    onTimeChange: (time) {
      setState(() {
        timePeriod =time;
        
      });
    },
  ),
    actions: <Widget>[  
              FlatButton(  
                child:Text('OK',style: TextStyle(color: Colors.red[300],fontSize: 20),),  
                onPressed: () {  
                  time = DateFormat.Hm().format(timePeriod);
                  Navigator.of(context).pop(); 
                  setState(() {
                    times.add(time);
                  });
           
                },  
              )  
            ],  
    );

      }
    );

  }
    DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();



  datePicker(BuildContext context){
    return showDialog(
      context: context,
      builder: (context){

    return AlertDialog(
      title:Text("Choose Start Date", textAlign: TextAlign.center) ,
      content:Container(
        height:100,
        width:100,
                child: DatePicker(
                  DateTime.now().add(Duration(days: 0)),
                  width: MediaQuery.of(context).orientation==Orientation.portrait?50:100,
                  height: 50,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                   
                    _selectedValue = date;                   
                    medStartDate = DateFormat('yyyy-MM-dd').format(_selectedValue);
                    setState(() {
                      dateController.text = medStartDate;
                    });
                   
                  }
                )
              ),
              actions: <Widget>[  
              new FlatButton(  
                child: new Text('OK',style: TextStyle(color: Colors.red[300],fontSize: 15),),  
                onPressed: () {  
                  
                  Navigator.of(context).pop(); 
                  
                },  
              )  
            ],  
      
    );
      
      }
    );
  }

  durationPicker(BuildContext context){
     return showDialog(
      context: context,
      builder: (context){

    return AlertDialog(
      title:Text("Choose Duration (number of days)", textAlign: TextAlign.center) ,
      content:new NumberPicker.integer(
                initialValue: 0,
                minValue: 0,
                maxValue: 365,
                highlightSelectedValue: true,
                decoration: BoxDecoration(color: Colors.red[100].withOpacity(0.2)),
                infiniteLoop: true,
                onChanged: (num){
                  medDuration = num;
                  setState(() {
                    
                    durationController.text = "$medDuration";

                  });
                }
                ),
              actions: <Widget>[  
              new FlatButton(  
                child: new Text('OK',style: TextStyle(color: Colors.red[300],fontSize: 15),),  
                onPressed: () {  
                  
                  Navigator.of(context).pop(); 
                  
                },  
              )  
            ],  
      
    );
      
      }
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
       var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
           
              Container(
                 height: orientation==Orientation.portrait? height*1.15: height*2.3,
                  width: width,
                  padding: EdgeInsets.symmetric(vertical:10,horizontal: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/stay-positive.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Container(
                      width: double.infinity,
                      child: Text("Add Medicine",textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontFamily: 'Merienda',color: Colors.black87,fontWeight: FontWeight.bold),)
                      ),
                     SizedBox(height: orientation==Orientation.portrait? height*0.07:height*0.16),
                  
                    Text("Name", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),),
                    SizedBox(height: orientation==Orientation.portrait? height*0.015:height*0.04),
                    Container(
                      padding: EdgeInsets.only(bottom:0,left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                      ),
                      child: TextField(
                        controller: medNameController,
                         style: TextStyle(
                        color: Colors.black87,
                         fontSize: 20,
                         fontFamily: 'Merienda',
                         fontWeight: FontWeight.w400,),
                         decoration: InputDecoration(
                          enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: UnderlineInputBorder(
                           borderSide: BorderSide.none
                         ),
                         
                         ),
                         
                       ),
                    ),
                    SizedBox(height: orientation==Orientation.portrait? height*0.03:height*0.07),
                    //DOSAGE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text("Dosage (per day)", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),),
                     Container(
                      
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                       color: Colors.white
                      ),
                       child: ButtonPicker(
                        minValue: 0,
                        maxValue: 10,
                        initialValue: 0,
                        onChanged: (val) => medDosage = val.toInt(),
                        step: 1,
                        horizontal: true,
                        loop: true,
                        padding: 5.0,
                        iconUp: Icons.keyboard_arrow_up,
                        iconDown: Icons.keyboard_arrow_down,
                        iconLeft: Icons.keyboard_arrow_left,
                        iconRight: Icons.keyboard_arrow_right,
                        iconUpRightColor: Colors.black87,
                        iconDownLeftColor: Colors.black87,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87
                        ),
                      ),
                     ),
                      ]
                    ),
                    SizedBox(height: orientation==Orientation.portrait? height*0.03:height*0.07),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    
                    Text("Choose \nTime Periods", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: RaisedButton.icon(
                        elevation: 0,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal:13,vertical:15),
                        onPressed: ()=>timePicker(context),
                        icon: Icon(Icons.access_time,color: Colors.red[700],), 
                        label: Text("Select Time",style: TextStyle(fontSize: 15, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),))),
                    ),
                    ]
                    ),
                    SizedBox(height: orientation==Orientation.portrait? height*0.015:height*0.035),
                    Container(
                      height:orientation==Orientation.portrait? height*0.06:height*0.1,
                      child:ListView(
                        scrollDirection: Axis.horizontal,
                        children: times.map((e) => TimePeriod(e)).toList(),
                      ),
                    ),
                    SizedBox(height: orientation==Orientation.portrait? height*0.03:height*0.07),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                    
                    Expanded(child: Text("Start Date", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),)),
                    SizedBox(width:20),
                     Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.calendar_today,size: 25,color: Colors.red[700],),
                               onPressed: ()=>datePicker(context)
                               ),
                            Container(
                              padding: EdgeInsets.all(0),
                              width: width*0.3,
                              child: TextField(
                                enabled: false,
                          controller: dateController,
                           style: TextStyle(
                          color: Colors.black87,
                           fontSize: 17,
                           fontFamily: 'Merienda',
                           fontWeight: FontWeight.w400,),
                           decoration: InputDecoration(
                              disabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide.none
                              ),
                           ),
                         ),
                            ),
                          ],
                        ),
                      ),
                    
                    ]
                    ),
                      SizedBox(height: orientation==Orientation.portrait? height*0.15:height*0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text("Interval of days", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),),
                     Container(
                      
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                       color: Colors.white
                      ),
                       child: ButtonPicker(
                        minValue: 0,
                        maxValue: 10,
                        initialValue: 0,
                        onChanged: (val) => medInterval = val.toInt(),
                        step: 1,
                        horizontal: true,
                        loop: true,
                        padding: 5.0,
                        iconUp: Icons.keyboard_arrow_up,
                        iconDown: Icons.keyboard_arrow_down,
                        iconLeft: Icons.keyboard_arrow_left,
                        iconRight: Icons.keyboard_arrow_right,
                        iconUpRightColor: Colors.black87,
                        iconDownLeftColor: Colors.black87,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87
                        ),
                      ),
                     ),
                      ]
                    ),
                   SizedBox(height: orientation==Orientation.portrait? height*0.03:height*0.25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Expanded(child: Text("Duration (in days)", style: TextStyle(fontSize: 21, fontFamily: 'Merienda',color: Colors.black.withOpacity(0.8),),)),
                    
                 
                        Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.date_range,size: 27,color: Colors.red[700],),
                               onPressed: ()=>durationPicker(context)
                               ),
                            Container(
                              padding: EdgeInsets.all(0),
                              width: width*0.12,
                              child: TextField(
                                enabled: false,
                          controller: durationController,
                           style: TextStyle(
                          color: Colors.black87,
                           fontSize: 17,
                           fontFamily: 'Merienda',
                           fontWeight: FontWeight.w400,),
                           decoration: InputDecoration(
                              disabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide.none
                              ),
                           ),
                         ),
                            ),
                          ],
                        ),
                      ),
                    
                      ]
                    ),
                    SizedBox(height: orientation==Orientation.portrait? height*0.03:height*0.07),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                          child: RaisedButton.icon(
                          elevation: 0,
                          color: Colors.black87,
                          padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
                          onPressed: ()=>submit(),
                          icon: Icon(Icons.add_circle,color:  Colors.white,), 
                          label: Text("Submit",style: TextStyle(fontSize: 20, fontFamily: 'Merienda',color: Colors.white,))),
                      ),
                    ),
                  ],
                ),
              ),
              
             
               Positioned(
                 top:orientation==Orientation.portrait?height*0.075:height*0.17,
                 left:width/2-50,
                child: SvgPicture.network(
                'https://www.svgrepo.com/show/47012/medicine.svg',
                 height:orientation==Orientation.portrait? height*0.15:height*0.3,  
                ),
                      ),
                Positioned(
                  top:height*0.02,
                  left:0,
                  child:IconButton(
                    padding: EdgeInsets.only(left:10),
                    alignment: Alignment.centerLeft,
                    icon: Icon(Icons.arrow_back_ios,color: Colors.black38,),
                    onPressed: ()=>Navigator.pop(context),
                  ),
                )
            ],
          )
        ),
      ),
    );
  }
}

