import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:foster/pages/auth.dart';
=======
import 'package:foster/pages/swipePages.dart';

>>>>>>> todo

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    supportedLocales: [
          const Locale('en', 'US'), // English
    ],
      debugShowCheckedModeBanner: false,
      title: 'Foster',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromRGBO(43, 203, 186, 1.0),
        accentColor: Color.fromRGBO(209, 216, 224, 1.0),
        fontFamily: 'Yrsa',
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Login()
    );
  }
}

