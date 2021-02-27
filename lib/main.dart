import 'package:flutter/material.dart';
import 'screens/welcome.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static final routes = {
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blue
      ),
      home: WelcomeScreen(),
    );
  }
}

