import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  startDatePicker(BuildContext context){
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true, 
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2025, 12, 31),
      onConfirm: (date) {
        setState(() {
        startDate = date;
        });
      },
      );
  }
  endDatePicker(BuildContext context){
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true, 
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2025, 12, 31),
      onConfirm: (date) {
        setState(() {
        endDate = date;
        });
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        
      ),
      body:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(startDate.toLocal().toString().split(' ')[0]),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      onPressed: () => startDatePicker(context),
                      child: Text('Select Start date'),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(endDate.toLocal().toString().split(' ')[0]),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      onPressed: () => endDatePicker(context),
                      child: Text('Select End date'),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}