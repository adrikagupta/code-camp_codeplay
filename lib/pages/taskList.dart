import 'package:flutter/material.dart';
import 'package:foster/pages/createTask.dart';
import 'package:intl/intl.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM - EEE').format(now);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size:35,color: Colors.white,),
        backgroundColor: Color.fromRGBO(253, 114, 114, 0.8),
        onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>CreateTask())),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/summer.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:0,vertical:0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:15),
                            width: width,
                            height:height*0.26,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(253, 114, 114,0.9),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                            ),
                            child:Column(
                              children: <Widget>[
                                Text("Tasks",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Merienda'),),
                                Text(formattedDate,style: TextStyle(fontSize: 23, color: Colors.white,fontFamily: 'Merienda')),
                                orientation==Orientation.portrait?SizedBox(height:6):SizedBox(height:0),
                                orientation==Orientation.portrait?Text("' Success is not final, failure is not fatal. It is the courrage to continue that counts. '",
                                style: TextStyle(fontSize: 23,color: Colors.white,letterSpacing: 1.1),textAlign: TextAlign.center,):Container(),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}