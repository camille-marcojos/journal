import 'package:flutter/material.dart';
import 'welcome.dart';

class NewEntryScreen extends StatefulWidget {

  //static const routeName = 'newEntry';
  
  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Journal Entry'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textPlaceholder(context),
          ],
        ),
      )
    );
  }
}

Widget textPlaceholder(BuildContext context) {
  return Container(
    child: Text('Add New Journal Entry', style: Theme.of(context).textTheme.headline6));
}
