import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entry_list.dart';
import 'screens/welcome.dart';
import 'screens/new_entry.dart';
import 'screens/journal_entry_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(preferences: await SharedPreferences.getInstance()));
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final SharedPreferences preferences;

  MyApp({Key key, @required this.preferences}) : super(key : key);

  static final routes = {
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    NewEntryScreen.routeName: (context) => NewEntryScreen(),
    EntriesListScreen.routeName: (context) => EntriesListScreen(),
  };

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  static const DARK_THEME = 'darkTheme';

  bool get darkTheme => widget.preferences.getBool(DARK_THEME) ?? false;

  void toggleTheme (bool value) {
      setState( () {
        //darkTheme = value;
        widget.preferences.setBool(DARK_THEME, !darkTheme);
      });
    }
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      routes: MyApp.routes,
    );
  }
}

