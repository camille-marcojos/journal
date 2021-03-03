import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/screens/journal_entry_list.dart';
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
      body: SafeArea(
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
      ),
    );
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
    }
    return null;

  }

  void validateAndSignIn(BuildContext context) {
    final formState = formKey.currentState;
    if(formState.validate()) {
      print('Logging you in...');
      formKey.currentState.save();
      //Database.of(context).saveJournalEntry(journalEntryFields);
      //Navigator.of(context).pop();
      Navigator.of(context).pushNamed(EntriesListScreen.routeName);
    }
  }
  
}