import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/new_entry.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static final routes = {
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    NewEntryScreen.routeName: (context) => NewEntryScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blue
      ),
      routes: routes,
    );
  }
}

