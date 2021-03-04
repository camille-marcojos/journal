import 'package:flutter/material.dart';
import '../widgets/journal_entry_form.dart';
import '../widgets/journal_drawer.dart';

class NewEntryScreen extends StatefulWidget {

  static const routeName = 'newEntry';

  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: JournalDrawer(),
      appBar: AppBar(
        title: Text('New Journal Entry'),
        actions: [
          Builder( 
            builder: (context) => IconButton( 
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          )
        ],
      ),
      body: JournalEntryForm(),
    );
  }
}

