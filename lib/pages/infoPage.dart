import 'package:flutter/material.dart';
import 'package:foster/pages/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();


class InfoPage extends StatelessWidget {

  logout(BuildContext context) async {
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var height = orientation==Orientation.landscape? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    var width = orientation==Orientation.portrait? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    
    return SafeArea(
           child: SingleChildScrollView(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right:5),
                        child: PopupMenuButton(
                          icon: Icon(Icons.more_horiz,size:30,color: Theme.of(context).primaryColor,),
                          itemBuilder: (context) => [
                          PopupMenuItem(
                          child: FlatButton.icon(
                          label:Text("Logout",style:TextStyle(fontSize:16,color: Colors.black87)),
                          icon:Icon(Icons.exit_to_app,size:20),
                          onPressed: ()=>logout(context)
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
                      ),
                    ],
                  ),
          Container(
            height:orientation==Orientation.portrait? height*0.5:height*0.5,
            width:orientation==Orientation.portrait?width:width,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/images/superpowers.jpg'),
                fit:BoxFit.cover
              ),
            ),
           
          ),
          SizedBox(height:height*0.015),
           Text('Superpowers of ADHD',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29.0,
                  color:Colors.black
                  // decoration: TextDecoration.underline,
                ),
              ),
          SizedBox(height:5),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20),
            child: Text('Be proud of your attention deficit hyperactivity disorder and all the out-of-the-box thinking, humor, drive, and passion it brings! Read on for some of the best traits of people with ADHD.',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                        fontSize: 17.0,
                        // decoration: TextDecoration.underline,
                        color: Colors.black54
                      ),
            ),
          ),
          SizedBox(
            height: height*0.03,
          ),
          Center(
            child: Container(
                height: height*0.7,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,8),
                    blurRadius: 8,
                  ),
                  
                ],
                borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Energetic',
                          style: TextStyle(
                                fontSize: 22.0,
                                // decoration: TextDecoration.underline,
                                color: Colors.black87
                              ),
                          ),
                        ),
                  ),
                  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
// <<<<<<< lullaby
//                  child: Image.network(
//                     'https://image.freepik.com/free-vector/businessman-after-getting-restful-sleep_24381-844.jpg',

                 child: Image.asset(
                   "assets/images/energy.png",

                    fit: BoxFit.cover,
                    width:orientation==Orientation.portrait? MediaQuery.of(context).size.width*0.55:width*0.9,
                    height: orientation==Orientation.portrait? MediaQuery.of(context).size.height*0.25:height*0.31,
                  ),
                 ),
             ),
            Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('Some with ADHD often have seemingly endless amounts of energy, which they are able to channel toward success on the playing field, school, or work.',
                 style: TextStyle(
                          fontSize: 18.0,
                          // decoration: TextDecoration.underline,
                          color: Colors.black54
                        ),
                ),
            ),
            
                ],
                ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
                height: 450.0,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,8),
                    blurRadius: 8,
                  ),
                  
                ],
                borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Spontaneous',
                          style: TextStyle(
                                fontSize: 22.0,
                                // decoration: TextDecoration.underline,
                                color: Colors.black87
                              ),
                          ),
                        ),
                  ),
                  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                 child: Image.network(
                    'https://image.freepik.com/free-vector/brainstorming-concept-illustration_114360-592.jpg',
                    fit: BoxFit.cover,
                    width:orientation==Orientation.portrait? MediaQuery.of(context).size.width*0.55:width*0.9,
                    height:orientation==Orientation.portrait? MediaQuery.of(context).size.height*0.25:height*0.31,
                  ),
                 ),
             ),
            Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('They may be the life of the party or may be more open and willing to try new things and break free from the status quo.',
                 style: TextStyle(
                          fontSize: 18.0,
                          // decoration: TextDecoration.underline,
                          color: Colors.black54
                        ),
                ),
            ),
            
                ],
                ),
            ),
          ),
          SizedBox(
            height: 130.0,
          ),
          Center(
            child: Container(
                height: 450.0,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,8),
                    blurRadius: 8,
                  ),
                  
                ],
                borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Creative and inventive',
                          style: TextStyle(
                                fontSize: 22.0,
                                // decoration: TextDecoration.underline,
                                color: Colors.black87
                              ),
                          ),
                        ),
                  ),
                  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                 child: Image.network(
                    'https://image.freepik.com/free-vector/building-graphic-design-creative-process_23-2148101309.jpg',
                    fit: BoxFit.cover,
                    width: orientation==Orientation.portrait? MediaQuery.of(context).size.width*0.55:width*0.9,
                    height: orientation==Orientation.portrait? MediaQuery.of(context).size.height*0.25:height*0.31,
                  ),
                 ),
             ),
            Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('Living with ADHD may give the person a different perspective on life and encourage them to approach tasks and situations with a thoughtful eye.',
                 style: TextStyle(
                          fontSize: 18.0,
                          // decoration: TextDecoration.underline,
                          color: Colors.black54
                        ),
                ),
            ),
            
                ],
                ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
                height: 450.0,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,8),
                    blurRadius: 8,
                  ),
                  
                ],
                borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Hyperfocused',
                          style: TextStyle(
                                fontSize: 22.0,
                                // decoration: TextDecoration.underline,
                                color: Colors.black87
                              ),
                          ),
                        ),
                  ),
                  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                 child: Image.network(
                    'https://image.freepik.com/free-vector/golden-cup-with-arrow-hitting-target-center_3446-458.jpg',
                    fit: BoxFit.cover,
                    width:orientation==Orientation.portrait? MediaQuery.of(context).size.width*0.55:width*0.9,
                    height:orientation==Orientation.portrait? MediaQuery.of(context).size.height*0.25:height*0.31,
                  ),
                 ),
             ),
            Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('The benefit to this is when given an assignment, a person with ADHD may work at it until its completion without breaking concentration.',
                 style: TextStyle(
                          fontSize: 18.0,
                          // decoration: TextDecoration.underline,
                          color: Colors.black54
                        ),
                ),
            ),
           SizedBox(
            height: 30.0,
          ),
            
                ],
                ),
            ),
          ),
          SizedBox(height: 30,)
                 ],
             ),
              
           )
           );
  }
}
