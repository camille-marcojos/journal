import 'package:flutter/material.dart';
import 'welcome.dart';

class NewEntryScreen extends StatefulWidget {

  static const routeName = 'newEntry';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cancelButton(context),
                saveButton(context),
              ]),
          ],
        ),
      ),
    );
  }
}

Widget textPlaceholder(BuildContext context) {
  return Container(
    child: Text('Add New Entry', style: Theme.of(context).textTheme.headline6));
}

Widget cancelButton(BuildContext context) {
  return RaisedButton(
    child: Text('Cancel', style: Theme.of(context).textTheme.headline6),
    onPressed: () => Navigator.pop(context)
  );
}

Widget saveButton(BuildContext context) {
  return RaisedButton(
    child: Text('Save', style: Theme.of(context).textTheme.headline6),
    onPressed: null,
  );
}