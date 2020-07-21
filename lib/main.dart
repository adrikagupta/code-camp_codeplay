import 'package:flutter/material.dart';

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
        primarySwatch: Color.fromRGBO(43, 203, 186, 1),
        accentColor: Color.fromRGBO(253, 114, 114, 1.0)
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

