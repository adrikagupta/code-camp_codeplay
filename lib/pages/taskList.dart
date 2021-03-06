import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foster/models/task.dart';
import 'package:foster/pages/createTask.dart';
import 'package:intl/intl.dart';
import 'package:smart_flare/actors/smart_flare_actor.dart';

class TaskList extends StatefulWidget {
  final String currentUserId;
  TaskList({this.currentUserId});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool taskCompleted = false;

  showWinner(bool completed, BuildContext context){
    if(completed==true){
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title:Text("Congratulations on completing a task! You are a winner! There are always new, grander challenges to confront, and a true winner will embrace each one.") ,
              titleTextStyle:  TextStyle(fontSize: 16,fontFamily: 'Merienda',color: Colors.black),
              content:Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                                  Container(
                                  child: Center(
                                  child: SmartFlareActor(
                                  height: MediaQuery.of(context).size.height*0.6,
                                  width: double.infinity,
                                  filename: "assets/rive/fireworks.flr",
                                  startingAnimation: 'fireworks', 
                                      ),
                                ),
                                   ),
                              
                                 Container(
                                child: Center(
                                child: SmartFlareActor(
                                height:double.infinity,
                                width: double.infinity,
                                filename: "assets/rive/first.flr",
                                startingAnimation: 'first', 
                                    ),
                              ),
                                 ),
                                
                  ],
                ),
              ),
              actions: <Widget>[  
              FlatButton(  
                child:Text('<-- Go back',style: TextStyle(color: Colors.red[300],fontSize: 18),),  
                onPressed: ()=>Navigator.pop(context)
              ),  
            ],  
            ));
    }
  }

  @override
  void initState() { 
    super.initState();
    
  }

  
 
  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM - EEE').format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:<Widget>[
              Container(
              width: width,
              height: height,
              decoration: BoxDecoration(    image: DecorationImage(
            image: AssetImage('assets/images/summer.jpg'),
            fit: BoxFit.cover
                        )
                      ),
            child: Container(
            padding: EdgeInsets.symmetric(horizontal:0,vertical:0),
            child: Column(
            children: <Widget>[
              Container(
                padding : EdgeInsets.symmetric(horizontal:15),
                width: width,
                height: orientation==Orientation.portrait?height*0.17:height*0.19,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(253, 114, 114,0.9),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                ),
                child:Column(
                  children: <Widget>[
                    Text("Tasks",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Merienda'),),
                    orientation==Orientation.portrait?Text(formattedDate,style: TextStyle(fontSize: 23, color: Colors.white,fontFamily: 'Merienda')):Container(),
                    
                  ],
                )
              ),

                           
        Container(
          margin: orientation==Orientation.portrait?EdgeInsets.only(top:40):EdgeInsets.only(top:5),
          height:orientation== Orientation.portrait? height*0.646: height*0.545,
          child: StreamBuilder(
            stream: tasksListRef.document(widget.currentUserId).collection('tasks').orderBy("orderDate").orderBy("taskTime").snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
                                    
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context,index){
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    TaskItem task= TaskItem.fromDocument(doc);
                    return Container(
                    height:orientation==Orientation.portrait?height*0.12:height*0.25,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal:10,vertical:15),
                    margin: EdgeInsets.symmetric(horizontal:10,vertical:5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.95),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                            icon: task.completed?Icon(Icons.check_box,size:30,color:Theme.of(context).primaryColor):Icon(Icons.check_box_outline_blank,size:30,color:Theme.of(context).primaryColor),
                             onPressed: ()async{
                              await tasksListRef.document(widget.currentUserId).collection('tasks').document(task.taskId).updateData({
                                'completed': !task.completed,
                              });
                              showWinner(!task.completed,context);
                              
                          },
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             task.completed? Text(task.taskName,overflow: TextOverflow.ellipsis, 
                             style:TextStyle(color:Colors.black87, fontSize: 18,fontFamily: 'Merienda',decoration: TextDecoration.lineThrough)):
                             Text(task.taskName,overflow: TextOverflow.ellipsis,
                             style:TextStyle(color:Colors.black87, fontSize: 18,fontFamily: 'Merienda')),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(task.taskDate, style:TextStyle(color:Colors.black54, fontSize: 15,fontFamily: 'Merienda')),
                                Text(task.taskTime, style:TextStyle(color:Colors.black54, fontSize: 15,fontFamily: 'Merienda')),
                              ],
                            ),
                          ],),
                          ),
                        PopupMenuButton(
                              icon: Icon(Icons.more_vert,size:30,color: Color.fromRGBO(253, 114, 114,0.9),),
                              itemBuilder: (context) => [
                          PopupMenuItem(
                          child: FlatButton.icon(
                          label:Text("Delete",style:TextStyle(fontSize:15,color: Colors.black87)),
                          icon:Icon(Icons.delete,size:20),
                          onPressed: ()async{
                            
                            Navigator.pop(context);
                            await tasksListRef.document(widget.currentUserId).collection('tasks').document(task.taskId).delete();
                          }
                        ),
                        
                      ),
                      PopupMenuItem(
                        child: FlatButton.icon(
                          label:Text("Cancel",style:TextStyle(fontSize:15,color: Colors.black87)),
                          icon:Icon(Icons.cancel,size:20),
                          onPressed: ()=>Navigator.pop(context)    
                        ),
                      ),
                      
                    ],
                     ),
                     ],
                     ),
                    );
                    },
                  );
              }
              ),
              )
              ],
              ),
            ),
            ),
              Positioned(
              top:orientation==Orientation.portrait?height*0.17 - 28:5,
              left:orientation==Orientation.portrait? width/2- 28: width-80,
              child: FloatingActionButton(
              child: Icon(Icons.add, size:35,color: Colors.white),
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>CreateTask(currentUserId: widget.currentUserId))),
            ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}