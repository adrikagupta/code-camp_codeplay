import 'package:flutter/material.dart';
import 'package:foster/pages/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();


class InfoPage extends StatelessWidget {

  logout(BuildContext context) async {
    await googleSignIn.signOut();
    print('logged out');
    // Navigator.pop(context);
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
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   Container(
                     height: height,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: RaisedButton.icon(
                               color: Theme.of(context).primaryColor,
                              icon: Icon(Icons.exit_to_app,
                                color: Colors.white,
                              ),
                              onPressed: ()=> logout(context),
                               label: Text('Logout',
                               style: TextStyle(
                                 color: Colors.white,
                               )
                               ),
          ),
                         ),
          Container(
            height:height*0.5,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/images/superpowers.jpg'),
                fit:BoxFit.cover
              ),
            ),
           
          ),
          SizedBox(height:10),
           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: Text('Superpowers of ADHD',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 29.0,
                    color:Colors.black
                    // decoration: TextDecoration.underline,
                  ),
                ),
           ),
          SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20),
            child: Text('Not every person with ADHD has the same personality traits, but there are some personal strengths that can make having the condition an advantage, not a drawback.',
                  // textAlign: TextAlign.center,
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
          
          
          // SizedBox(
          //   height: 30.0,
          // ),
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
                 child: Image.network(
                    'https://image.freepik.com/free-vector/businessman-after-getting-restful-sleep_24381-844.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width*0.55,
                    height: MediaQuery.of(context).size.height*0.25,
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
                    width: MediaQuery.of(context).size.width*0.55,
                    height: MediaQuery.of(context).size.height*0.25,
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
                    width: MediaQuery.of(context).size.width*0.55,
                    height: MediaQuery.of(context).size.height*0.25,
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
                    width: MediaQuery.of(context).size.width*0.55,
                    height: MediaQuery.of(context).size.height*0.25,
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
                 ],
             ),
              
           )
    );
  }
}
