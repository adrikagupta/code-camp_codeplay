import 'package:flutter/material.dart';

class TimePeriod extends StatelessWidget {
  final String time;
  TimePeriod(this.time);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container (
      margin: EdgeInsets.only(right:10),
      padding: EdgeInsets.all(10),

      width:width*0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
      ),
      child:Center(
        child:Text(time)
      )
    );
  }
}