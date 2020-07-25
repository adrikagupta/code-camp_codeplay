import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foster/models/med.dart';
import 'package:foster/pages/createMed.dart';
import 'package:foster/widgets/customIcon.dart';
import 'package:intl/intl.dart';

class MedsTracker extends StatefulWidget {
  final String currentUserId; 
  MedsTracker({this.currentUserId});
  @override
  _MedsTrackerState createState() => _MedsTrackerState();
}

class _MedsTrackerState extends State<MedsTracker> {

  
  bool medtaken;

  onMedTaken(Med med)async{
   setState(() {
    this.medtaken = !medtaken;
   });
   
     await medsListRef.document(widget.currentUserId).collection('meds').document(med.medId).updateData({
     "medTaken":medtaken,
   });
  
    var dosage = med.medDosage - 1;
    if(dosage!=0){
      print(medtaken);
     await medsListRef.document(widget.currentUserId).collection('meds').document(med.medId).updateData({
     "medTaken": !medtaken,
     "medDosage":dosage,
   });
    
    }
    else{
      var duration = med.medDuration - 1;
      
      if(duration!=0){
       DateTime startDateTime = DateFormat("yyyy-MM-dd").parse(med.medStartDate);
       var addedDate = startDateTime.add(Duration(days:med.medInterval));
       String formattedAddedDate = DateFormat('yyyy-MM-dd').format(addedDate);
       
      var timeLength = med.medTimePeriods.length;
      await medsListRef.document(widget.currentUserId).collection('meds').document(med.medId).updateData({
        'medDuration': duration,
        'medStartDate': formattedAddedDate,
        'medDosage': timeLength,
        'medTaken':false
      });
      }
      else{
         await medsListRef.document(widget.currentUserId).collection('meds').document(med.medId).delete();

      }
    }
  
  }
                                     

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedNowdate = DateFormat("yyyy-MM-dd").format(now);
    
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:<Widget>[
              Container(
              height: height,
              width:width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/flower-two.jpg"),
                  fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children:<Widget>[
                    Expanded(
                      child: Container(
                        height: orientation==Orientation.portrait?height*0.17:height*0.255,
                        decoration: BoxDecoration(
                        color: Color.fromRGBO(94, 181, 165,1),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))
                        ),
                        padding: orientation==Orientation.portrait?EdgeInsets.only(left:10,top:5):EdgeInsets.only(left:width*0.12,top:height*0.05),
                        child: Text("Medicine Tracker",textAlign: TextAlign.center,style: TextStyle(fontSize: orientation==Orientation.portrait?height*0.047:height*0.11,color:Colors.white,fontFamily: 'Merienda',fontWeight: FontWeight.bold),)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
                        child: Container(
                        height:orientation==Orientation.portrait?height*0.17:height*0.255,
                        width: orientation==Orientation.portrait?width*0.3:width*0.21,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/help-capsule.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    ]
                  ),
                 
                  Container(
                    height: orientation== Orientation.portrait? height*0.62: height*0.43,
                    margin: orientation==Orientation.portrait?EdgeInsets.only(top:40):EdgeInsets.only(top:5),
                    child:StreamBuilder(
                      stream: medsListRef.document(widget.currentUserId).collection('meds').where("medStartDate",isEqualTo:formattedNowdate).snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(),);
                        }

                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context,index){
                            DocumentSnapshot doc = snapshot.data.documents[index];
                            Med med = Med.fromDocument(doc);
                            medtaken = med.medTaken;
                            var dex = med.medTimePeriods.length - med.medDosage;
                            
                            return Container(
                              height:orientation==Orientation.portrait?height*0.15:height*0.3,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal:10,vertical:13),
                              margin: EdgeInsets.symmetric(horizontal:10,vertical:5),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                             ),
                             child: Row(
                               children: <Widget>[
                                 Icon(MyFlutterApp.pill, size: 38,color: Colors.orange[900],),
                                 SizedBox(width:10),
                                 Expanded(
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:<Widget>[
                                       Text(med.medName,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 23,color:Colors.black87),),
                                       PopupMenuButton(
                                      icon: Icon(Icons.more_horiz,size:30,color: Theme.of(context).primaryColor,),
                                      itemBuilder: (context) => [
                                      PopupMenuItem(
                                      child: FlatButton.icon(
                                      label:Text("Delete",style:TextStyle(fontSize:16,color: Colors.black87)),
                                      icon:Icon(Icons.delete,size:20),
                                      onPressed: ()async{
                            
                                        Navigator.pop(context);
                                        await medsListRef.document(widget.currentUserId).collection('meds').document(med.medId).delete();
                                      }
                                    ),                      
                                  ),
                                      PopupMenuItem(
                                        child: FlatButton.icon(
                                          label:Text("Cancel",style:TextStyle(fontSize:16,color: Colors.black87)),
                                          icon:Icon(Icons.cancel,size:20),
                                          onPressed: ()=>Navigator.pop(context)    
                                        ),
                                      ),
                                    ],
                                     ),
                                        ]
                                       ),
                                       Spacer(),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           Text('Dose left: ${(med.medDosage).toInt()}',style: TextStyle(fontSize: 15,color:Colors.black.withOpacity(0.7))),
                                           Text(med.medTimePeriods[dex],style: TextStyle(fontSize: 15,color:Colors.black.withOpacity(0.7))),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(width:10),
                                 IconButton(
                                   icon: medtaken?Icon(MyFlutterApp.thumbs_up_alt, size: 33,color: Colors.orange[900],):Icon(MyFlutterApp.thumbs_up, size: 33,color: Colors.orange[900],),
                                   onPressed: ()=> onMedTaken(med)
                                   )
                               ],
                             ),
                            );
                          }
                          );
                      },
                    ),
                  ),
                  
                   
                ],
              ),
            ),
            Positioned(
              top:orientation==Orientation.portrait?height*0.17-26:height*0.04,
              left:orientation==Orientation.portrait?width/2-26:20,
              child: FloatingActionButton(
                  child: Icon(Icons.add, size:35,color: Colors.white),
                  backgroundColor: Colors.orange[900].withOpacity(0.9),
                  onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder:(context)=>CreateMed(currentUserId: widget.currentUserId))),
                  ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}