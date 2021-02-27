
import 'package:flutter/material.dart';
import 'new_entry.dart';

class WelcomeScreen extends StatelessWidget {

  final String title = 'Welcome';
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            journalIcon(context),
            textPlaceholder(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushAddJournalEntry(context),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget journalIcon(BuildContext context) {
  return Container(
    child: Icon(
      Icons.book,
      size: 100.0,)
    );
}

Widget textPlaceholder(BuildContext context) {
  return Container(
    child: Text('Journal', style: Theme.of(context).textTheme.headline6));
}

void pushAddJournalEntry(BuildContext context) {
  Navigator.of(context).pushNamed(NewEntryScreen.routeName);
}