import 'package:flutter/material.dart';
import 'package:journal/main.dart';


class JournalDrawer extends StatefulWidget {

  @override
  _JournalDrawerState createState() => _JournalDrawerState();

}

class _JournalDrawerState extends State<JournalDrawer> {


  @override
  Widget build(BuildContext context) {
    
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();
    
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.all(0.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: appState.darkTheme,
              onChanged: appState.toggleTheme,
            ),
          ],
        ),
    );
  }
}