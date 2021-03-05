import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/journal_entry_list.dart';
import 'package:sqflite/sqflite.dart';

class JournalEntryFields {
  String title;
  String body;
  int rating;
  DateTime date;
  String toString() {
    return 'Title: $title, Body: $body, Rating: $rating, Date: $date';
  }
}

class JournalEntryForm extends StatefulWidget {

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {

  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: ListView(
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
      );
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
      onPressed: () {
        validateAndSignIn(context); 
        FocusScope.of(context).unfocus();
      },
    );
  }

  List<Widget> formFields(BuildContext context) {
    return [
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Title', border: OutlineInputBorder()),
        validator: (value) => validateTitle(value),
        onSaved: (value) {
          // Store value in some object
          journalEntryFields.title = value;
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Body', border: OutlineInputBorder()),
        validator: (value) => validateBody(value),
        onSaved: (value) {
          // Store value in some object
          journalEntryFields.body = value;
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Rating', border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        validator: (value) => validateRating(value),
        onSaved: (value) {
          // Store value in some object
          journalEntryFields.rating = int.parse(value);
        },
      ),
    ];
  }

  String validateTitle(String title) {
    if(title.isEmpty){
      return 'Please enter a title';
    }
    return null;
  }

  String validateBody(String body){
    if(body.isEmpty){
      return 'Please enter a body';
    }
    return null;

  }

  String validateRating(String rating){
    if(rating.isEmpty){
      return 'Please enter a rating';
    }else if(int.parse(rating) < 1 || int.parse(rating) > 4 )
      return 'Please enter a rating between 1-4';
    else
      return null;
  }

  void validateAndSignIn(BuildContext context) async {
    final formState = formKey.currentState;
    if(formState.validate()) {
      print('Logging you in...');
      formKey.currentState.save();
      addDateToJournalEntryValues();
      await deleteDatabase('journal.sqlite3.db');
      //print({journalEntryFields});
      final Database database = await openDatabase('journal.sqlite3.db', version: 1, onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
      });
      await database.transaction((txn) async {
        await txn.rawInsert('INSERT INTO journal_entries(title, body, rating, date) VALUES(?,?,?,?)',[journalEntryFields.title,journalEntryFields.body,journalEntryFields.rating,journalEntryFields.date.toString()]);
      });
      var db = await openDatabase('journal.sqlite3.db');
      await db.close();
      //Database.of(context).saveJournalEntry(journalEntryFields);
      Navigator.of(context).pop();
      //Navigator.of(context).pushNamed(EntriesListScreen.routeName);
    }
  }

  void addDateToJournalEntryValues() {
    journalEntryFields.date = DateTime.now();
  }
  
}