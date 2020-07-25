import 'package:flutter/material.dart';
import 'package:foster/pages/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SafeArea(
           child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   RaisedButton.icon(
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
          
          Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text('Benifits of ADHD',
                    style: TextStyle(
                      fontSize: 35.0,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
          ),
          Text('Not every person with ADHD has the same personality traits, but there are some personal strengths that can make having the condition an advantage, not a drawback.',
                
                style: TextStyle(
                      fontSize: 18.0,
                      // decoration: TextDecoration.underline,
                      color: Colors.black54
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
                    'https://image.freepik.com/free-photo/joyful-young-woman-yellow-shirt-jumping-celebrating_74952-246.jpg',
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
              child: Text('Living with ADHD may give the person a different perspective on life and encourage them to approach tasks and situations with a thoughtful eye. As a result, some with ADHD may be inventive thinkers.',
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
              child: Text('This makes them so intently focused on a task that they may not even notice the world around them. The benefit to this is when given an assignment, a person with ADHD may work at it until its completion without breaking concentration.',
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
                 ],
             ),
              ),
           )
    );
  }
}
