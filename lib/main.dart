import 'package:flutter/material.dart';
import 'package:foster/pages/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foster',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromRGBO(43, 203, 186, 1.0),
        accentColor: Color.fromRGBO(209, 216, 224, 1.0),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Login()
    );
  }
}

