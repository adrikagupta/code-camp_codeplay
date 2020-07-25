import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:foster/models/user_model.dart';
import 'package:foster/pages/exerciseNyoga.dart';

import 'package:foster/pages/sleep.dart';



import 'package:foster/pages/infoPage.dart';
import 'package:foster/pages/medsTracker.dart';

import 'package:foster/pages/exercise.dart';
import 'package:foster/pages/sleepSchedule.dart';

import 'package:foster/pages/taskList.dart';
import 'package:foster/widgets/customIcon.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class HomePage extends StatefulWidget {
  final String userId;
  HomePage({this.userId});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int _selectedIndex = 0;

  @override
  void initState() { 
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int _selectedIndex){
    setState(() {
      this._selectedIndex=_selectedIndex;
    });
  }

  onTap(int _selectedIndex){
    pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 40), curve:Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white10,
        items: <Widget>[
          Icon(MyFlutterApp.bed, size: 23,color: Colors.white,),
          Icon(MyFlutterApp.fitness_center, size: 23,color: Colors.white,),
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(MyFlutterApp.tasks, size: 23,color: Colors.white,),
          Icon(MyFlutterApp.hand_holding_medical, size: 23,color: Colors.white,),
        ],
        onTap: onTap,
       ),
      body:PageView(
        children: <Widget>[
          SleepSchedule(userId: widget.userId),
          YogaExercise(),
          InfoPage(),
          TaskList(currentUserId: widget.userId),
          MedsTracker(currentUserId: widget.userId),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}