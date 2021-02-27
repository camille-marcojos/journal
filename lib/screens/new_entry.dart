import 'package:flutter/material.dart';
import 'welcome.dart';

class JournalEntryFields {
  String title;
  String body;
  int rating;
  String toString() {
    return 'Title: $title, Body: $body, Rating: $rating';
  }
}


class NewEntryScreen extends StatefulWidget {

  static const routeName = 'newEntry';

  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {

  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Journal Entry'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column( 
                    children: formFields(context),
                  )
                ),
            ),
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

List<Widget> formFields(BuildContext context) {
  return [
    TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Title', border: OutlineInputBorder()),
      validator: null,
    ),
    SizedBox(height: 10),
    TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Body', border: OutlineInputBorder()),
      validator: null,
    ),
    SizedBox(height: 10),
    TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Rating', border: OutlineInputBorder()),
      validator: null,
    ),
  ];
}